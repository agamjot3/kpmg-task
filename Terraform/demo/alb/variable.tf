variable "openvpn_instance_name" {
  description = "Name of EC2 Instance"
  type        = string
  default     = "demo-kpmg-openvpn"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3a.micro"
}



variable "default_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default = {
    "Environment" = "demo",
    "Owner"       = "Agamjot Singh"
  }
}

variable "volume_type" {
  description = "EC2 Volume Type"
  type        = string
  default     = "gp3"
}

variable "encrypted_volume" {
  description = "EC2 EBS Encryption"
  type        = bool
  default     = true
}

variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
  default     = "ami-080e1f13689e07408"
}



variable "name_ssh_sg" {
  description = "Name of the Security group"
  type        = string
  default     = "kpmg-ssh-sg"
}



variable "name_alb_sg" {
  description = "Name of the Security group"
  type        = string
  default     = "kpmg-alb1-sg"
}

variable "name_pvt_alb_sg" {
  description = "Name of the Security group"
  type        = string
  default     = "kpmg-pvt-alb-sg"
}

variable "name_front_end_sg" {
  description = "Name of the Security group"
  type        = string
  default     = "kpmg-front-end-sg"
}

variable "name_back_end_app_sg" {
  description = "Name of the Security group"
  type        = string
  default     = "kpmg-back-end-app-sg"
}

variable "name_db_sg" {
  description = "Name of the Security group"
  type        = string
  default     = "kpmg-db-sg"
}



variable "region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "Key name of Launch configuration"
  type        = string
  default     = "kpmg-demo"
}



variable "alb_name" {
  description = "Name of Front End ALB"
  type        = string
  default     = "kpmg-demo-front-end-alb"
}

variable "pvt_alb_name" {
  description = "Name of Back End ALB"
  type        = string
  default     = "kpmg-demo-back-end-alb-pvt"
}

variable "alb_type" {
  description = "Do you want internal alb"
  type        = bool
  default     = false
}

variable "pvt_alb_type" {
  description = "Do you want internal alb"
  type        = bool
  default     = true
}

variable "enable_deletion_protection" {
  description = "Deletion protection for ALB"
  default     = false
  type        = bool
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "logs_bucket" {
  type        = string
  description = "Name of bucket where we would be storing our logs"
  default     = "demo"
}

variable "enable_logging" {
  type    = bool
  default = false
}
variable "alb_certificate_arn" {
  description = "Cretificate arn for alb"
  type        = string
  default     = ""
}

