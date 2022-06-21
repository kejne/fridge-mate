# Fridge Mate

Do you have a fridge at work or in a club, selling stuff for internal use?
This is intended to be a simple program which can be used to facilitate this.

I'm doing this with very limited time as a small project to learn some Golang amoung others, so it might take a while before anything comes up here, if ever ;)

## Ideas

- With account it should be very quick to choose an item
- No checkout-procedure - you can revert transactions instead
- No login = simply display price to pay (large)

## Technical Ideas

- Use oauth2 for users. Integrate with auth0?
- Leverage AWS Lambda & Dynamodb and use static web page since it will be low & irregular traffic
- Continue!

### Detailed technical setup ideas

- S3 & CloudFront to serve static page
  - jQuery to on client side fetch dynamic data like products 
- Use AWS cognito to authenticate users
- API Gateway backed by AWS Cognito user pool as authorizer
- Lambdas to handle requests
- DynamoDb to handle inventory & transactions