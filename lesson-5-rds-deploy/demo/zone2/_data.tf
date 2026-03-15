data "aws_caller_identity" "current" {}

data "terraform_remote_state" "primary" {
  backend = "s3" 
  config = {
     bucket = "udacity-tf-flc-east" # Replace it with your S3 bucket name which is in us-east-2 region
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
}