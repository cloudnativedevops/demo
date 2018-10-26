provider "google" {}

resource "google_storage_bucket" "bucket" {
  name = "${var.phase}-${var.your_name}-cloudnativedevops-${var.name}-bucket"

  labels {
    app   = "${var.name}"
    phase = "${var.phase}"
  }
}
