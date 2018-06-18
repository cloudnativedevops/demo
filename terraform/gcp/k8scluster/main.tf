provider "google" {}

resource "google_container_cluster" "k8s-cluster" {
  name               = "${var.environment}-cloudnativedevops-${var.name}-k8s-cluster"
  initial_node_count = "${var.initial_node_count}"
  zone               = "${var.zone}"
}
