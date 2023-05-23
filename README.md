# E360 Take Home Terraform Assignment

## NOTE:
The providers block is defined to use the default location for AWS Secret Key and Access key. The value for the location is defined with defalt values in the Variable blocks. This default values can be modified either in the variable default values or defined as environment variables when running `terraform plan` or `terraform apply`




# Fairwinds Terraform Task

The terraform task is to create an Ec2 instance to AWS and a web-app with django-framework in a Docker container. 

This terraform code will create an Amazon EC2 instance with Amazon Linux2 AMI with containerized web-app running in the instance.

Below are guides and instructions to deploy.

## Requirements

* Terraform CLI
* Git
* Terraform minimum version = 0.12.0
* A default VPC should be available in the region
* AWS credentials should be available at the default location or provide another location should it not be at the default location


## Prerequsites

* Create an AWS Default VPC in the region to deploy the EC2 instance if one is not available.



## Steps to run/deploy terraform code

* Open terminal/poweshell and run `git clone https://github.com/ceagone/e360-task.git` to clone the repo locally.

* `cd e360-task` to change directory of the cloned repository where the module is available

* Provide variables in your .tfvars file in the same working directory if you choose not to export or define local variables.

* Run `terraform init` to initialize the working directory.

* Run `terraform fmt` to properly format the terraform codes.

* Run `terraform validate` to validate if the code has an error or not.

* Run `plan` to see the plan of the resources to be created

* Run `terraform apply -auto-approve` to create resources

* To clean up run `terraform destory -auto-approve` to destory.