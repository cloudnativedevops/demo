provider "aws" {}

resource "aws_s3_bucket" "demo" {
  bucket = "<YOUR_NAME>-cloudnativedevops-demo-bucket"
  acl    = "private"

  tags {
    Name        = "Demo"
    Environment = "Test"
  }
}
