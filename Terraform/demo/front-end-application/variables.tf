variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}

variable "env_name" {
  type    = string
  default = "demo"
}

variable "application_name" {
  type        = string
  description = "Name of the Application"
  default     = "demo-kpmg"
}

variable "listener_rule_condition_values_host" {
  type    = list(string)
  default = ["demo.kpmg.com"]
}

variable "listener_rule_condition_values_path" {
  type    = list(string)
  default = null
}

variable "ami_id" {
  type    = string
  default = "ami-080e1f13689e07408"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "volume_size" {
  type    = number
  default = 8
}
variable "asg_min_size" {
  type    = number
  default = 1
}

variable "asg_max_size" {
  type    = number
  default = 1
}

variable "asg_desired_size" {
  type    = number
  default = 1
}

variable "key_name" {
  type        = string
  description = "pem key string for fe instances"
  default     = "demo-kpmg"
}

variable "fe_public_key" {
  description = "Public Key for Key-Pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQChTFwIVwtV7tqMk2Kf0jy9zv8Grk7lBiBQtFgt4LFT/HLg5RiwA5ZOzvBTMVBuXDBCrf/jreqpY6el4Z4IMqSS2UNgZAdiGbefeP+VVqMbYM0WEVJXa5Jam1ZuHhivIwHw55i3FT8mK6TreAfZt+sfEavfSQgFiKcFkmkkVIp6IMga7J//tPq3/okfjFLkR1zJkuvCNAG7hwi9ReE4Tjjvh5ACZSJ/giROM5XAFJOpeha4XzW696BoNfB8+sB2/IbM0taRM2NCgrfm3cTVC1QJznqufW2rYfIKB5ryA4ow2tyX/PgiSP33C10h4jKWQKKOk9Jo8g2gRV5NZW63sRWO/asgA4pk7/Uq4r4EIw3XOP5MqaFqf5UtpsFwjeXRQPXNHorob4aEFtFuAmBWIkNFN59oMGu0kZ04OzwPn9n2gLEhWXZfzxfy1q9CrBfb1QxifevJC/igQ/cfRlFxNWX7p8dtDChIJLEFdfotoyk7DXd8bDFFINN3v7T2XyaFMqk= opstree@opstree-Latitude-3410"
}

variable "volume_encryption" {
  type        = bool
  description = "(Optional) Whether to enable volume encryption. Defaults to false."
  default     = true
}

variable "asg_policy_state" {
  type    = bool
  default = true
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default = {
    Environment = "demo"
    Owner       = "Agamjot Singh"
  }
}

variable "userdata_path" {
  description = "Path to userdata script"
  type = string
}

