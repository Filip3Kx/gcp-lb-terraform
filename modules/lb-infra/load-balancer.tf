module "lb" {
  source = "GoogleCloudPlatform/lb/google"
  version = "2.2.0"
  region = var.region
  name = "terraform-lb"
  service_port = 80
  target_tags = ["terraform-tp"]
  network = google_compute_network.terraform-network.name
}