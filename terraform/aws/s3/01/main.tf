provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "<YOUR_NAME>-cloudnativedevops-demo-bucket"
  acl    = "private"

  tags {
    App         = "demo"
    Environment = "test"
  }
}
