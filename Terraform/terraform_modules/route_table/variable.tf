variable "vpc_id" {
  description = "VPC ID in which Route table needs to be created"
  type        = string
}

variable "name" {
  description = "Name of Route Table To be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "routes" {
  description = "Map of routes to be created in the route table"
  type        = map(any)
  default     = {}
}
