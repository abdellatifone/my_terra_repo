terraform {
  backend "gcs" {
    bucket = "tf-state-gcp-batch-ingestion"
    region = "us-central1"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "sandbox-257707"
  region = "us-central1-a"
}

resource "google_storage_bucket" "funky-bucket" {
  name = "batch-pipeline"
  storage_class = "REGIONAL"
  location  = "us-central1"
}
