provider "google" {
    credentials = file("key.json")
    project     = "caramel-compass-393820"
    region      = "europe-west1-b"
}

module "lb-infrastructure" {
  source = "./modules/lb-infra"

  project = "caramel-compass-393820"
  min_replicas = 3
  scale_target = 0.5
  instance_type = "n1-standard-1"
  instance_startup_script = <<EOF
    echo 123
    echo testing tf modules
  EOF
}