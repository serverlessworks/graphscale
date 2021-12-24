locals {
  lambda_name = "${var.environment}-${var.project}-graphql"
}

module "graphql_lambda_function" {
  source                 = "terraform-aws-modules/lambda/aws"
  version                = "2.26.0"
  function_name          = local.lambda_name
  handler                = "index.handler"
  runtime                = var.lambda_config.runtime
  timeout                = var.lambda_config.timeout
  memory_size            = var.lambda_config.memory_size
  publish                = true
  create_package         = false
  local_existing_package = "./builds/lambda.zip"

  environment_variables = {
    ENV      = var.environment
    NODE_ENV = var.node_env
    PROJECT  = var.project
    OWNER    = var.owner
    REGION   = var.region
  }

  allowed_triggers = {
    apiGateway = {
      service    = "apigateway"
      source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*/POST/graphql"
    }
  }

  attach_cloudwatch_logs_policy = false
  policy_statements = {
    logging = {
      actions = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
      resources = [
        "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${local.lambda_name}:*",
        "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${local.lambda_name}:*:*",
      ]
    }
  }

  layers = [
    module.graphql_lambda_layer.lambda_layer_arn,
  ]

  tags = {
    ENV     = var.environment
    PROJECT = var.project
    OWNER   = var.owner
  }

  provisioned_concurrent_executions = var.lambda_config.provision
}

module "graphql_lambda_layer" {
  source                 = "terraform-aws-modules/lambda/aws"
  layer_name             = "${var.environment}-${var.project}-graphql-lambda-layer-s3"
  description            = "My amazing lambda layer (deployed from S3)"
  compatible_runtimes    = ["nodejs14.x"]
  local_existing_package = "./builds/nodejs.zip"
  create_layer           = true
  create_package         = false
}
