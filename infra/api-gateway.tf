resource "aws_api_gateway_rest_api" "api" {
  name = "${var.environment}-${var.project}-api"
}

resource "aws_api_gateway_deployment" "api" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  variables = {
    "deployedAt" = timestamp()
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_api_gateway_integration.graphql_integration]
}

resource "aws_api_gateway_stage" "api" {
  stage_name    = var.environment
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.api.id
}

resource "aws_api_gateway_resource" "graphql_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "graphql"
}

resource "aws_api_gateway_method" "graphql_method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.graphql_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "graphql_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.graphql_resource.id
  http_method = aws_api_gateway_method.graphql_method.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration" "graphql_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.graphql_resource.id
  http_method             = aws_api_gateway_method.graphql_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.graphql_lambda_function.lambda_function_invoke_arn
}
