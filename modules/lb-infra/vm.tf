resource "google_compute_instance_group_manager" "terraform-gm" {
    name = "terraform-gm"
    zone = var.zone
    project = var.project
    version {
      instance_template = google_compute_instance_template.terraform-instance-template.self_link
      name = "primary"
    }
    target_pools = [module.lb.target_pool]
    base_instance_name = "terraform"
}

#hard coded image
data "google_compute_image" "debian" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "terraform-instance-template" {
    name = "terraform-instance-template"
    machine_type = var.instance_type
    can_ip_forward = false
    project = var.project
    tags = [ "allow-http", "allow-ssh", "allow-lb-service" ]
    disk {
      source_image = data.google_compute_image.debian.self_link
    }
    network_interface {
      network = google_compute_network.terraform-network.name
      access_config {}
    }
    metadata_startup_script = var.instance_startup_script
}