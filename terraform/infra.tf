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


resource "google_storage_bucket" "static-site" {
  name          = "image-store-com13"
  location      = "EU"
  force_destroy = true
  uniform_bucket_level_access = true
}
