variable "name" {
  description = "Name of bastion"
  type        = string
  default     = ""
}
variable "public_ip" {
  description = "IP of bastion"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
variable "subnet_id" {
  description = "Zones to launch our instances into"
  type        = string
  default     = ""
}
variable "volume_size" {
  description = "volume size"
  type        = number
}

variable "volume_type" {
  description = "volume type"
  type        = string
  default     = "gp2"
}

variable "volume_encryption" {
  description = "encrypt volume"
  type        = bool
  default     = "false"
}

variable "ami_id" {
  description = "Name of Launch configuration"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "Key name of Launch configuration"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "Name of Launch configuration"
  type        = string
  default     = ""
}
variable "instance_profile" {
  description = "Name of IAM Instance Profile to start with"
  type        = string
  default     = ""
}
variable "security_groups" {
  description = "Name of Launch configuration"
  type        = list(string)
  default     = []
}

