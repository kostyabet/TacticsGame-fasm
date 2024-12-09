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
	Id       string `json:"id"`
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
	router.GET("/users", PrintUsers)

	router.Run("localhost:8080")
	// AddUser(4, "login", "password")

	// PrintUsers()
}

func AddUser(id int, login string, password string) {
	result, err := db.Exec("INSERT INTO player (player_id, pl_login, pl_pswrd) VALUES ($1, $2, $3)", id, login, password)
	if err != nil {
		panic(err)
	}
	fmt.Println(result.RowsAffected())
}

func PrintUsers(c *gin.Context) {
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
