terraform {
  backend "gcs" {
    bucket = "tf-state-gcp-batch-ingestion"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "sandbox-257707"
  region = "australia-southeast1-a"
}

resource "google_storage_bucket" "funky-bucket" {
  name = "batch-pipeline"
  storage_class = "REGIONAL"
  location  = "australia-southeast1"
}
