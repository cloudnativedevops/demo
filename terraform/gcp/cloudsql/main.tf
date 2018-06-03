provider "google" {}

resource "google_storage_bucket" "bucket" {
  name = "<YOUR_NAME>-cloudnativedevops-${var.name}-bucket"

  labels {
    app         = "${var.name}"
    environment = "${var.environment}"
  }
}

resource "google_sql_database_instance" "db" {
  name             = "cloudnativedevops-${var.name}-db"
  database_version = "POSTGRES_9_6"

  settings {
    tier = "db-f1-micro"
  }
}
