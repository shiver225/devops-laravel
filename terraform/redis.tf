resource "google_redis_instance" "cache" {
  name           = "laravel-redis"
  memory_size_gb = 1
  region         = var.region

  redis_version = "REDIS_6_X"
  tier          = "BASIC"

  authorized_network = google_compute_network.vpc.id
}

resource "google_compute_network" "vpc" {
  name                    = "laravel-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "laravel-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc.id
  region        = var.region
}
