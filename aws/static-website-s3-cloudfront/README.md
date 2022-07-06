# Static website deployment in AWS S3

A sample deployment of static website deployment using terraform in AWS S3 and serving the site using cloudfront.

## Pre-requisite

* terraform is installed
* aws cli is installed
* Access to aws is configured
* terraform remote backend has configured in s3 bucket to store terraform state file. Please update backend block of terraform.tf file. 

## How to deploy?

* Inititialize terraform configuration: 
```
terraform init
```
* Generate plan: 
```
terraform plan
```
* Apply terraform plan: 
```
terraform apply --auto-approve
```




