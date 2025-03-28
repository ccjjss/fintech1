variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Nombre del clúster ECS."
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "Bloque CIDR para la VPC."
  type        = string
}

variable "public_subnets" {
  description = "List CIDRs public"
  type        = list(string)
}

variable "private_subnets" {
  description = "List CIDRs private"
  type        = list(string)
}

variable "allowed_ips" {
  description = "List IPs public Allowed"
  type        = list(string)
}

