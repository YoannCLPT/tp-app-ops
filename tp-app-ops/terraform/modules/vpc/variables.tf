variable "network_name" {
  type        = string
}

variable "auto_create_subnetworks" {
  type        = bool
  default     = false
}

variable "subnet_name" {
  type        = string
}

variable "ip_cidr_range" {
  type        = string
}

variable "region" {
  type        = string
}
