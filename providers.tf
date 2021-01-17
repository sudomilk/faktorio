provider "google" {
  project     = "goldfishparty-cluster"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = var.gac
}

provider "kubernetes" {
  host = google_container_cluster.primary.endpoint

  client_certificate     = file(google_container_cluster.primary.master_auth.0.client_certificate)
  client_key             = file(google_container_cluster.primary.master_auth.0.client_key)
  cluster_ca_certificate = file(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)

  load_config_file = false # when you wish not to load the local config file
}
