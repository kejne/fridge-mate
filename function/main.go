package main

import (
	"context"

	"github.com/aws/aws-lambda-go/events"
	runtime "github.com/aws/aws-lambda-go/lambda"
)

func handleRequest(ctx context.Context, event events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	response := &events.APIGatewayProxyResponse{
		Body: productsJson(),
	}

	return *response, nil
}

func main() {
	runtime.Start(handleRequest)
}
