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

resource "google_storage_bucket" "static-sitep" {
  name          = "image-store-com133"
  location      = "EU"
  force_destroy = true
  uniform_bucket_level_access = true
}


# this is your Terraform Snowflake provider
terraform {
    required_providers {
        snowflake = {
            source  = "Snowflake-Labs/snowflake"
            version = "0.39.0"
        }
    }
}
# connect to your Snowflake account
provider "snowflake" {
    account = "zm61867"
    region = "europe-west2.gcp"
    username = "ASKALLI"
    password = "A6D9BAA5b15a$"
    role = "accountadmin"
}
# create one "my_tf_database.my_tf_schema.my_tf_table" db table
resource "snowflake_database" "database" {
  name      = "my_tf_database"
}
resource "snowflake_schema" "schema" {
  database  = snowflake_database.database.name
  name      = "my_tf_schema"
}
resource "snowflake_table" "table" {
  database  = snowflake_database.database.name
  schema    = snowflake_schema.schema.name
  name      = "my_tf_table"
column {
    name     = "id"
    type     = "int"
  }
  column {
    name     = "data"
    type     = "text"
  }
}
