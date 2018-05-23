terraform {
  backend "gcs" {
    bucket = "cloudnativedevops-terraform-state"
    prefix = "terraform/state"
    region = "us-west1"
  }
}

variable "gce_region" {
  default = "us-west1"
}

variable "project" {
  default = "YOUR-GCP-PROJECT-ID"
}

variable "network" {
  default = "network"
}

provider "google" {
  project = "${var.project}"
  region  = "${var.gce_region}"
}

resource "google_compute_network" "network" {
  name                    = "${var.network}"
  auto_create_subnetworks = "false"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_subnetwork" "subnet-10" {
  name                     = "subnet-10"
  ip_cidr_range            = "192.168.10.0/24"
  network                  = "${google_compute_network.network.self_link}"
  region                   = "us-west1"
  private_ip_google_access = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_container_cluster" "cloudnativedevops" {
  name               = "cloudnativedevops"
  zone               = "${var.gce_region}-a"
  initial_node_count = 0
  enable_legacy_abac = false
  network            = "${var.network}"

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      "node_config.oauth_scopes",
      "ip_allocation_policy",
      "master_authorized_networks_config",
    ]
  }
}

resource "google_container_node_pool" "pool-1" {
  name       = "pool-1"
  zone       = "${var.gce_region}-a"
  cluster    = "${google_container_cluster.cloudnativedevops.name}"
  node_count = 1
}
