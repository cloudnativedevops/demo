provider "google" {}

resource "google_storage_bucket" "bucket" {
  name = "${var.environment}-<YOUR_NAME>-cloudnativedevops-${var.name}-bucket"

  labels {
    app         = "${var.name}"
    environment = "${var.environment}"
  }
}

resource "google_sql_database_instance" "db" {
  name             = "${var.environment}-cloudnativedevops-${var.name}-db"
  database_version = "POSTGRES_9_6"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_container_cluster" "k8s-cluster" {
  name               = "${var.environment}-cloudnativedevops-${var.name}-k8s-cluster"
  initial_node_count = "${var.initial_node_count}"
  zone               = "${var.zone}"
}
