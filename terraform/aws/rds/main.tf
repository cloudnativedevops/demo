provider "aws" {}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "cloudnativedevops-rds-cluster-demo"
  engine                  = "aurora-postgresql"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "demo"
  master_username         = "foo"
  master_password         = "change-me-please"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}
