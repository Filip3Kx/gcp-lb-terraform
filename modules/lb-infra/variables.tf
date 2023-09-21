#GCP INFO
variable "region" {
  type = string
  default = "europe-west1"
}

variable "zone" {
  type = string
  default = "europe-west1-b"
}

variable "project" {
  type = string
  default = "undefined"
}


#AUTOSCALER
variable "max_replicas" {
  type = string
  default = 5
}

variable "min_replicas" {
  type = string
  default = 2
}

variable "scale_target" {
  type = string
  default = 0.7
}


#VM's
variable "instance_type" {
  type = string
  default = "f1-micro"
}

variable "instance_startup_script" {
  type = string
  default = <<EOF
    sudo apt update
    sudo apt install -y nginx
    echo "hello world 1" | sudo tee /var/www/html/index.html
    sudo systemctl restart nginx
  EOF
}

#LB