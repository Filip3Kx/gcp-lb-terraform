# gcp-lb-terraform
A terraform module to spin up load balanced and autoscaled VM's

## Default values
- `region` = europe-west1
- `zone` = europe-west1-b
- `project` = undefined
- `max_replicas` = 5
- `min_replicas` = 2
- `scale_target` = 0.7
- `instance_type` = f1-micro
- `instance_startup_script` = a script to install nginx and print something into index html

## Hard-coded values
- All names
- Instance image
- Firewall tags
- Some key values to be changed only if you know what you are doing

## Example use

```hcl
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
```
