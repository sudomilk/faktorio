provider "google" {
  project     = "goldfishparty-cluster"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = var.gac
}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.primary.endpoint}"
  token                  = var.gac
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}
