provider "google" {
  credentials = var.GOOGLE_CREDENTIALS
  project     = "cooking-bomb"
  region      = "asia-northeast1"
  zone        = "asia-northeast1-a"
}
