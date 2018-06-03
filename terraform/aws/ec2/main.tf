provider "aws" {}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-justind-cloudnativedevops-${var.name}-bucket"
  acl    = "private"

  tags {
    Name       = "${var.name}"
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
    Name       = "${var.name}"
    Environent = "${var.environment}"
  }
}

resource "aws_instance" "vm" {
  ami           = "ami-b6e499ce"
  instance_type = "t2.micro"

  tags {
    Name       = "${var.environment}-${var.name}"
    Environent = "${var.environment}"
  }
}
