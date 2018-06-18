provider "google" {}

resource "google_storage_bucket" "bucket" {
  name = "${var.environment}-${var.your_name}-cloudnativedevops-${var.name}-bucket"

  labels {
    app         = "${var.name}"
    environment = "${var.environment}"
  }
}
