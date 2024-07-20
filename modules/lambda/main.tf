resource "aws_lambda_function" "database_interaction" {
  filename      = var.filename   
  function_name = var.function_name 
  role          = var.aws_iam_role 
  handler       = var.handler
  runtime       = var.runtime  # Adjust based on Lambda function runtime

  vpc_config {
    subnet_ids         = [var.private_subnet]     // Subnets where the Lambda function will run
    security_group_ids = [var.security_group_db]  // Security group that allows outbound access to RDS
  }

  environment {
    variables = {
      DB_HOST     = var.db_instance_endpoint  # Using RDS endpoint from output
      DB_PORT     = "5432"  # PostgreSQL default port
      DB_NAME     = var.db_name  
      DB_USER     = var.db_username  
      DB_PASSWORD = var.db_password  
    }
  }

  timeout = 30  # Timeout in seconds for Lambda function execution

  tags = {
    Environment = "production"
  }
}

