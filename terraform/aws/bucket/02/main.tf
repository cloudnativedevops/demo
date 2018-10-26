provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.phase}-${var.your_name}-cloudnativedevops-${var.name}-bucket"
  acl    = "private"

  tags {
    App   = "${var.name}"
    Phase = "${var.phase}"
  }
}
