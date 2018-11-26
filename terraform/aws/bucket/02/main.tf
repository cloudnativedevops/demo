provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-${var.your_name}-cloudnativedevops-${var.name}-bucket"
  acl    = "private"

  tags {
    App         = "${var.name}"
    environment = "${var.environment}"
  }
}
