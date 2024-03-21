variable "vpc_id" {}
variable "subnet_name" {
  description = "Name of the Subnet group"
  type        = string
}
variable "availability_zones" {
  type = list(string)
}
variable "tags" {
  description = "A map of tags to be added to subnets"
  type        = map(string)
  default     = {}
}
variable "subnets_cidr" {
  description = "List of CIDR's for subnets"
  type        = list(string)
}
variable "route_table_id" {
  description = "Route table to which subnets will be associated"
  type        = string
  default     = null
}

variable "route_table_ids" {
  description = "Route table to which subnets will be associated"
  type        = list(string)
  default     = null
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}