provider "aws" {}

resource "aws_rds_cluster" "db" {
  cluster_identifier  = "cloudnativedevops-${var.name}-rds-cluster"
  engine              = "aurora-postgresql"
  database_name       = "${var.name}"
  master_username     = "foo"
  master_password     = "change-me-please"
  skip_final_snapshot = true

  tags {
    App         = "${var.name}"
    environment = "${var.environment}"
  }
}
