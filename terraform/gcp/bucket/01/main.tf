provider "google" {}

resource "google_storage_bucket" "bucket" {
  name = "test-<YOUR_NAME>-cloudnativedevops-demo-bucket"

  labels {
    app         = "demo"
    environment = "test"
  }
}
