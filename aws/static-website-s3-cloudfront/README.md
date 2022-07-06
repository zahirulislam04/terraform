# Static website deployment in AWS S3

A sample deployment of static html website deployment using terraform in AWS S3 and serving the site using cloudfront.

## Pre-requisite

* terraform is installed
* aws cli is installed
* Access to aws is configured
* terraform remote backend has configured in s3 bucket to store terraform state file. Please update backend.conf file with updated s3 bucket name. 

## How to deploy?

* Inititialize terraform configuration: 
```
terraform init -backend-config=backend.conf
```
* Generate plan: 
```
terraform plan
```
* Apply terraform plan: 
```
terraform apply --auto-approve
```




