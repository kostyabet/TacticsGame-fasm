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
	Id       int    `json:"id"`
	Login    string `json:"login"`
	Password string `json:"password"`
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
	router.GET("/players", PrintPlayers)

	router.Run("localhost:8080")
}

func AddPlayer(c *gin.Context) {
	var newPleyer player
	if err := c.BindJSON(&newPleyer); err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{"error": "Invalid request payload"})
		return
	}

	stmt, err := db.Prepare("INSERT INTO player (player_id, pl_login, pl_pswrd) VALUES ($1, $2, $3)")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	if _, err := stmt.Exec(newPleyer.Id, newPleyer.Login, newPleyer.Password); err != nil {
		log.Fatal(err)
	}

	c.JSON(http.StatusCreated, newPleyer)
}

func PrintPlayers(c *gin.Context) {
	c.Header("Content-Type", "application/json")

	rows, err := db.Query("SELECT * FROM player")
	if err != nil {
		panic(err)
	}
	defer rows.Close()
	var players []player
	for rows.Next() {
		var p player
		err := rows.Scan(&p.Id, &p.Login, &p.Password)
		if err != nil {
			fmt.Println(err)
		}
		players = append(players, p)
	}
	err = rows.Err()
	if err != nil {
		log.Fatal(err)
	}
	// for _, p := range players {
	// 	fmt.Println(p.Id, p.Login, p.Password)
	// }

	c.IndentedJSON(http.StatusOK, players)
}

func GetNewId() {

}

func GetBestScores() {

}
