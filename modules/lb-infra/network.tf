resource "google_compute_network" "terraform-network" {
    name = "terraform-network"
}



resource "google_compute_firewall" "ssh-rule" {
  name = "terraform-ssh"
  network = google_compute_network.terraform-network.name
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  target_tags = ["allow-ssh"]
  source_ranges = ["0.0.0.0/0"]
}



resource "google_compute_firewall" "http-rule" {
  name = "terraform-http"
  network = google_compute_network.terraform-network.name
  allow {
    protocol = "tcp"
    ports = ["80"]
  }
  target_tags = ["allow-http"]
  source_ranges = ["0.0.0.0/0"]
}