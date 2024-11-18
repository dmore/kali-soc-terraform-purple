terraform {
  backend "s3" {
    bucket  = <S3 bucket name> #make sure to create bucket
    key     = "<filename of state file>/terraform.tfstate" #this will auto create when you name it
    region  = "us-east-1" # Change this to your desired region
    encrypt = true
  }
}