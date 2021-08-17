resource "aws_lambda_function" "aws_lambda_function_tracing_rule_pass" {
  function_name = "my-function"
  runtime       = "python3.8"
  handler       = "main.handler"
  filename      = "function.zip"

  # Enable active tracing
  tracing_config {
    mode = "Active"
  }
}