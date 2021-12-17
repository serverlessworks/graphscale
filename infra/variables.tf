variable "environment" {}

variable "owner" {
  type    = string
  default = "GraphScale"
}

variable "project" {
  type    = string
  default = "graphscale"
}

variable "node_env" {
  type    = string
  default = "dev"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "tags" {
  type = object({
    Owner       = string
    Environment = string
    ManagedBy   = string
  })
}

variable "lambda_config" {
  type = object({
    runtime     = string
    timeout     = number
    memory_size = number
    provision   = number
  })
  default = {
    runtime     = "nodejs14.x"
    timeout     = 60
    memory_size = 128
    provision   = 0
  }
}
