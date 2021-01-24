provider "google" {
  project     = "goldfishparty-cluster"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = var.gac
}