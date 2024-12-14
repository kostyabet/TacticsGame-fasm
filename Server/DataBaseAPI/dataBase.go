package main

import (
	"database/sql"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"regexp"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
	"golang.org/x/crypto/bcrypt"
)

type player struct {
	Login    string `json:"login"`
	Password string `json:"password"`
}

type idStruct struct {
	Id int `json:"id"`
}

type score struct {
	Points   int `json:"points"`
	PlayerId int `json:"player_id"`
}

type outputScore struct {
	ScoreID int `json:"score_id"`
	Points  int `json:"points"`
}

type bestScore struct {
	ScoreID int    `json:"score_id"`
	Points  int    `json:"points"`
	Login   string `json:"pl_login"`
}

var db *sql.DB

func main() {
	var err error
	var host string
	var port string

	err = godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	env := flag.String("env", "dev", "Set environment (dev or prod)")
	flag.Parse()

	if *env == "dev" {
		host = os.Getenv("DEV_HOST")
		port = os.Getenv("DEV_PORT")
	} else {
		host = os.Getenv("PROD_HOST")
		port = os.Getenv("PROD_PORT")
	}

	connStr := "host=go_db user=postgres password=postgres dbname=postgres sslmode=disable"
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	log.Println("CORRECT CONNECT TO DATA BASE CYKAAAAAAAAAAAAAAAAA")

	//create the table if it doesn't exist
	_, err = db.Exec("CREATE TABLE IF NOT EXISTS players (player_id SERIAL PRIMARY KEY, pl_login varchar(30) NOT NULL, pl_password varchar(30) NOT NULL)")
	if err != nil {
		log.Fatal(err)
	}
	log.Println("create players table")
	_, err = db.Exec("CREATE TABLE IF NOT EXISTS scores (score_id SERIAL PRIMARY KEY, points INT NOT NULL, fk_player_id INT, FOREIGN KEY (fk_player_id) REFERENCES players(player_id));")
	if err != nil {
		log.Fatal(err)
	}
	log.Println("create scores table")

	router := gin.Default()
	router.POST("/players", AddPlayer)
	router.GET("/players", IsPlayerExist)
	router.POST("/scores", AddScore)
	router.GET("/scores", AllUserScores)
	router.GET("/bestscores", AllBestScores)
	var url = fmt.Sprintf("%s:%s", host, port)
	router.Run(url)
}

func AddPlayer(c *gin.Context) {
	var newPlayer player
	if err := c.BindJSON(&newPlayer); err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Invalid request payload"})
		return
	}

	if len(newPlayer.Login) > 3 {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Login must be at most 3 characters long"})
		return
	}

	passwordRegex := `^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$`
	matched, err := regexp.MatchString(passwordRegex, newPlayer.Password)
	if err != nil || !matched {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Password must be at least 8 characters long and contain at least one letter and one number"})
		return
	}

	var existingID int
	err = db.QueryRow("SELECT player_id FROM players WHERE pl_login = $1", newPlayer.Login).Scan(&existingID)
	if err != nil && err != sql.ErrNoRows {
		log.Fatal(err)
	}

	if existingID != 0 {
		c.AbortWithStatusJSON(http.StatusConflict, gin.H{"error": "Login already exists"})
		return
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(newPlayer.Password), bcrypt.DefaultCost)
	if err != nil {
		log.Fatal(err)
	}

	stmt, err := db.Prepare("INSERT INTO players (pl_login, pl_password) VALUES ($1, $2) RETURNING player_id")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	var generatedID int
	err = stmt.QueryRow(newPlayer.Login, hashedPassword).Scan(&generatedID)
	if err != nil {
		log.Fatal(err)
	}
	var newId idStruct
	newId.Id = generatedID
	c.JSON(http.StatusCreated, newId)
}

func IsPlayerExist(c *gin.Context) {
	var newPlayer player
	if err := c.BindJSON(&newPlayer); err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Invalid request payload"})
		return
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(newPlayer.Password), bcrypt.DefaultCost)
	if err != nil {
		log.Fatal(err)
	}

	var playerExists bool
	err = db.QueryRow("SELECT EXISTS(SELECT 1 FROM players WHERE pl_login = $1 AND pl_password = $2)", newPlayer.Login, hashedPassword).Scan(&playerExists)
	if err != nil {
		log.Fatal(err)
	}

	var newId idStruct
	if playerExists {
		var playerID int
		err := db.QueryRow("SELECT player_id FROM players WHERE pl_login = $1 AND pl_password = $2", newPlayer.Login, hashedPassword).Scan(&playerID)
		if err != nil {
			log.Fatal(err)
		}
		newId.Id = playerID
	} else {
		newId.Id = -1
	}
	c.JSON(http.StatusCreated, newId)
}

func AddScore(c *gin.Context) {
	var newScore score
	if err := c.BindJSON(&newScore); err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Invalid request payload"})
		return
	}

	var playerExists bool
	err := db.QueryRow("SELECT EXISTS(SELECT 1 FROM players WHERE player_id = $1)", newScore.PlayerId).Scan(&playerExists)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(playerExists)
	if !playerExists {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Player does not exist"})
		return
	}
	stmt, err := db.Prepare("INSERT INTO scores (points, fk_player_id) VALUES ($1, $2) RETURNING score_id")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	var generatedID int
	err = stmt.QueryRow(newScore.Points, newScore.PlayerId).Scan(&generatedID)
	if err != nil {
		log.Fatal(err)
	}
	var newId idStruct
	newId.Id = generatedID
	c.JSON(http.StatusCreated, newId)
}

func AllUserScores(c *gin.Context) {
	var curId idStruct
	if err := c.BindJSON(&curId); err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Invalid request payload"})
		return
	}

	var playerExists bool
	err := db.QueryRow("SELECT EXISTS(SELECT 1 FROM players WHERE player_id = $1)", curId.Id).Scan(&playerExists)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(playerExists)
	if !playerExists {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Player does not exist"})
		return
	}

	rows, err := db.Query("SELECT score_id, points FROM scores WHERE fk_player_id = $1", curId.Id)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var scores []outputScore

	for rows.Next() {
		var score outputScore
		if err := rows.Scan(&score.ScoreID, &score.Points); err != nil {
			log.Fatal(err)
		}
		scores = append(scores, score)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	c.JSON(http.StatusOK, scores)
}

func AllBestScores(c *gin.Context) {
	query := `
		SELECT score_id, points, pl_login
		FROM (
			SELECT s.score_id, s.points, p.pl_login,
				ROW_NUMBER() OVER (PARTITION BY s.fk_player_id ORDER BY s.points DESC) AS rn
			FROM scores s
			JOIN players p ON s.fk_player_id = p.player_id
		) AS ranked_scores
		WHERE rn = 1
		LIMIT 30
	`

	rows, err := db.Query(query)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var bestScores []bestScore
	for rows.Next() {
		var score bestScore
		if err := rows.Scan(&score.ScoreID, &score.Points, &score.Login); err != nil {
			log.Fatal(err)
		}
		bestScores = append(bestScores, score)
	}

	if err := rows.Err(); err != nil {
		log.Fatal(err)
	}

	c.JSON(http.StatusOK, bestScores)
}
