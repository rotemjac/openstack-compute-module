variable "image_name" {
  description = "The image name"
  default     = "cirros-0.3.5-x86_64-disk"
}

variable "flavor_id" {
  description = "The flavor ID"
  default     = 3//"m1.small"
}



variable "network_name" {
  description = "The name of network"
  default     = ""
}

variable "number_of_servers" {
  default     = "2"
}