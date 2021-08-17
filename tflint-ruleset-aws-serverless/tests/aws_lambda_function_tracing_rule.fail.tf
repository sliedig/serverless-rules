resource "aws_lambda_function" "aws_lambda_function_tracing_rule_fail" {
  function_name = "my-function"
  runtime       = "python3.8"
  handler       = "main.handler"
  filename      = "function.zip"
}