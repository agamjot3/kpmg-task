
variable "alb_name" {
  description = "Name of ALB"
  type        = string
}

variable "internal" {
  type = bool
}

variable "security_groups_id" {
  description = "Security groups to be associated with ALB"
  type        = list(string)
}

variable "subnets_id" {
  description = "Subnets to be mapped with ALB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  default = false
  type    = bool
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "logs_bucket" {
  type        = string
  description = "Name of bucket where we would be storing our logs"
  default     = "test"
}

variable "enable_logging" {
  type    = bool
  default = false
}


