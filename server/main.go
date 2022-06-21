package main

import (
	"net/http"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

var products = []product{
	{
		ProductId: "Coca-Cola",
		ImgPath:   "https://iconarchive.com/download/i82484/musett/coca-cola/Coke-Zero.ico",
	},
	{
		ProductId: "Protein Bar",
		ImgPath:   "https://images.allematpriser.no/https%3A%2F%2Fd1hr6nb56yyl1.cloudfront.net%2Fproduct-images%2F93246-560.jpg",
	},
}

type product struct {
	ProductId string
	ImgPath   string
}

func setupRouter() *gin.Engine {
	// Disable Console Color
	// gin.DisableConsoleColor()
	r := gin.Default()
	r.Use(cors.Default())

	r.GET("/products", func(c *gin.Context) {

		c.JSON(http.StatusOK, products)
	})

	return r
}

func main() {
	r := setupRouter()
	r.Run(":8080")
}
