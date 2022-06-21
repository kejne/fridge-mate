package main

import (
	"context"
	"os"
	"testing"
	"time"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambdacontext"
	"github.com/stretchr/testify/assert"
)

func TestGetResponse(t *testing.T) {
	d := time.Now().Add(50 * time.Millisecond)
	os.Setenv("AWS_LAMBDA_FUNCTION_NAME", "get-products")

	ctx, _ := context.WithDeadline(context.Background(), d)
	ctx = lambdacontext.NewContext(ctx, &lambdacontext.LambdaContext{
		AwsRequestID:       "495b12a8-xmpl-4eca-8168-160484189f99",
		InvokedFunctionArn: "arn:aws:lambda:eu-north-1:123456789012:function:get-products",
	})

	event := &events.APIGatewayProxyRequest{
		Body: "TESTING",
	}

	response, _ := handleRequest(ctx, *event)

	assert.Equal(t,productsJson(),response.Body)
}