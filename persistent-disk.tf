resource "google_compute_disk" "default" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}
