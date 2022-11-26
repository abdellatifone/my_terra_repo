terraform {
  backend "gcs" {
    bucket = "tf-state-gcp-batch-ingestion"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "sandbox-257707"
}

resource "google_storage_bucket" "funky-bucket" {
  name = "batch-pipeline-vx"
  storage_class = "REGIONAL"
  location  = "us-central1"
}
