provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "foo-cloudnativedevops-demo-bucket"
  acl    = "private"

  tags {
    App         = "demo"
    environment = "test"
  }
}
