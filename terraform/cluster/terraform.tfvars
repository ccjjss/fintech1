aws_region = "us-east-1"

cluster_name = "fintech-cluster"

vpc_name = "fintech-vpc"
  
vpc_cidr_block = "10.0.0.0/16"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

private_subnets = [
  "10.0.101.0/24",
  "10.0.102.0/24",
  "10.0.103.0/24"
]

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

allowed_ips = [
  "186.84.20.167/32",
  "186.84.20.168/32"
]



alb_name = "finaktiva-alb"

container_configs = [
  {
    name          = "app1"
    image         = "nginx:latest"
    port          = 80
    cpu           = 256
    memory        = 512
    desired_count = 2
  },
  {
    name          = "app2"
    image         = "httpd:latest"
    port          = 80
    cpu           = 256
    memory        = 512
    desired_count = 2
  }
]

