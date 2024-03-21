variable "subnets_id" {
  type = list(string)
}

variable "name" {
  description = "Name of VPC in which NAT will be created"
  type        = string
}

variable "nat_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = null
}

variable "eip_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = null
}

variable "enable_az_specific" {
  type = bool
}

