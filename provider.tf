provider "aws" {
  shared_config_files      = var.aws_shared_config
  shared_credentials_files = var.aws_shared_credentials
  region                   = var.region
  profile                  = var.profile

}

terraform {
  required_version = ">= 0.12.0"
}