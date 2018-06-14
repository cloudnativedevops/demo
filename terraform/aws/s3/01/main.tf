provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "justind-cloudnativedevops-demo-bucket"
  acl    = "private"

  tags {
    App         = "demo"
    Environment = "test"
  }
}
