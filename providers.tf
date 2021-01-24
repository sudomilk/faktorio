provider "google" {
  project     = "goldfishparty-cluster"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = var.gac
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.primary.endpoint}"
  token                  = var.gac
  cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}
