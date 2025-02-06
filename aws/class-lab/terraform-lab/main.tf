terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.85.0"
    }
  }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true

  endpoints {
    lambda         = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    iam           = "http://localhost:4566"
  }
}

resource "aws_secretsmanager_secret" "db_secret" {
  name = "MyDatabaseSecret"

  lifecycle {
    ignore_changes = [name]  # Prevents Terraform from failing if the secret already exists
  }
}


resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "admin"
    password = "SuperSecret123"
  })
}

resource "aws_lambda_function" "my_lambda" {
  function_name    = "MyLambdaFunction"
  role            = aws_iam_role.lambda_role.arn
  runtime         = "python3.8"
  handler         = "lambda_function.lambda_handler"
  filename        = "function.zip"
  source_code_hash = filebase64sha256("function.zip")
  timeout         = 60  # Increase timeout if needed

  lifecycle {
    ignore_changes = [source_code_hash]  # Prevent unnecessary function redeployment
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "lambda_function_name" {
  value = aws_lambda_function.my_lambda.function_name
}


