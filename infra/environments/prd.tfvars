environment = "prd"
owner       = "GraphScale"
region      = "eu-west-2"

tags = {
  Owner       = "GraphScale"
  Environment = "production"
  ManagedBy   = "Terraform"
}

lambda_config = {
  runtime     = "nodejs14.x"
  timeout     = 30
  memory_size = 1024
}
