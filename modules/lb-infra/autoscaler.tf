resource "google_compute_autoscaler" "terraform-autoscaler" {
    name = "terraform-autoscaler"
    zone = var.zone
    target = google_compute_instance_group_manager.terraform-gm.name
    autoscaling_policy {
      max_replicas = var.max_replicas
      min_replicas = var.min_replicas
      cooldown_period = 60
      cpu_utilization {
        target = var.scale_target
      }
    }
}