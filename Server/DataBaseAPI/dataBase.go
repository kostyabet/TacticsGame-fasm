package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

var db *sql.DB

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

func main() {
	var err error
	connStr := "host=localhost user=postgres password=postgres dbname=tacticsgamedb sslmode=disable"
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	router := gin.Default()
	router.POST("/players", AddPlayer)
	router.GET("/players", IsPlayerExist)
	router.POST("/scores", AddScore)
	router.GET("/scores", AllUserScores)
	router.GET("/bestscores", AllBestScores)
	router.Run("localhost:8080")
}

func AddPlayer(c *gin.Context) {
	var newPlayer player
	if err := c.BindJSON(&newPlayer); err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Invalid request payload"})
		return
	}

	stmt, err := db.Prepare("INSERT INTO players (pl_login, pl_password) VALUES ($1, $2) RETURNING player_id")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	var generatedID int
	err = stmt.QueryRow(newPlayer.Login, newPlayer.Password).Scan(&generatedID)
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

	var playerExists bool
	err := db.QueryRow("SELECT EXISTS(SELECT 1 FROM players WHERE pl_login = $1 AND pl_password = $2)", newPlayer.Login, newPlayer.Password).Scan(&playerExists)
	if err != nil {
		log.Fatal(err)
	}

	var newId idStruct
	if playerExists {
		var playerID int
		err := db.QueryRow("SELECT player_id FROM players WHERE pl_login = $1 AND pl_password = $2", newPlayer.Login, newPlayer.Password).Scan(&playerID)
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
