provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-<YOUR_NAME>-cloudnativedevops-${var.name}-bucket"
  acl    = "private"

  tags {
    App        = "${var.name}"
    Environent = "${var.environment}"
  }
}

resource "aws_rds_cluster" "db" {
  cluster_identifier  = "${var.environment}-cloudnativedevops-${var.name}-rds-cluster"
  engine              = "aurora-postgresql"
  database_name       = "${var.environment}_${var.name}"
  master_username     = "foo"
  master_password     = "change-me-please"
  skip_final_snapshot = true

  tags {
    App        = "${var.name}"
    Environent = "${var.environment}"
  }
}

resource "aws_instance" "vm" {
  ami           = "ami-b6e499ce"
  instance_type = "t2.micro"

  tags {
    App        = "${var.name}"
    Environent = "${var.environment}"
    Name       = "${var.environment}-${var.name}"
  }
}
