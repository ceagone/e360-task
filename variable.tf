variable "aws_shared_config" {
  description = "The location of AWS Config File"
  default     = ["$HOME/.aws/config"]
}

variable "aws_shared_credentials" {
  description = "AWS credentials path"
  default     = ["$HOME/.aws/credentials"]
}

variable "profile" {
  description = "Specify profile if it is more than one"
  default     = "default"
}

variable "region" {
  description = "AWS region to deploy resources"
  # default     = "us-east-1"
}

variable "key_name" {
  description = "Name of the ssh-key"
  # default     = "key.pem"
}

variable "instance_type" {
  description = "Type of Instance to be selected"
  # default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID of the subnet in Default VPC"
  # default     = "subnet-009604323e61d9d14"
}

variable "vpc_id" {
  description = "ID of the VPC"
  # default     = "vpc-01317df0fb74b3341"
}
