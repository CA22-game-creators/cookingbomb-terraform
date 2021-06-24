provider "google" {
  project = "cooking-bomb"
  region  = "us-west1"
}

terraform {
  backend "gcs" {
    bucket = "cookingbomb-tfstate-bucket"
  }
}
