package main

import "encoding/json"

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

func productsJson() string {
	json, _ := json.Marshal(&products)
	return string(json)
}
