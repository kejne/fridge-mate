data "archive_file" "getproducts" {
  type = "zip"

  source_file = "${path.module}/../function/main"
  output_path = "${path.module}/../.tmp/getproducts.zip"
}

resource "aws_s3_object" "getproducts_object" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "getproducts.zip"
  source = data.archive_file.getproducts.output_path

  etag = filemd5(data.archive_file.getproducts.output_path)
}


resource "aws_lambda_function" "getproducts_lambda" {
  function_name = "GetProducts"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.getproducts_object.key

  runtime     = "go1.x"
  handler     = "main"
  memory_size = 128

  source_code_hash = data.archive_file.getproducts.output_base64sha256

  role = aws_iam_role.lambda_exec.arn
}

resource "aws_cloudwatch_log_group" "getproducts_cw" {
  name = "/aws/lambda/${aws_lambda_function.getproducts_lambda.function_name}"

  retention_in_days = 30
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "function_name" {
  description = "Name of the Lambda function."

  value = aws_lambda_function.getproducts_lambda.function_name
}