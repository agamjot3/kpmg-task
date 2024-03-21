variable "region" {
  type    = string
  default = "us-east-1"
}

variable "default_tags" {
  type = object({
    ManagedBy   = string
    Environment = string
    Owner       = string
  })
  default = {
    ManagedBy   = "Terraform"
    Environment = "KPMG-Demo"
    Owner       = "Agamjot Singh"
  }
  description = "All common tags related to setup"
}


variable "name" {
  type    = string
  default = "kpmg-demo"
}

variable "pvt_zone_name" {
  type    = string
  default = "kpmg.internal"
}

variable "vpc_details" {
  type = object({
    cidr_block = string
  })
  default = {
    cidr_block = "10.0.0.0/19"
  }
}

variable "pub_subnets_detail" {
  type = object({
    name        = string
    cidr_blocks = list(string)
    tags        = optional(map(string))
  })
  default = {
    name        = "pub"
    cidr_blocks = ["10.0.16.0/23", "10.0.18.0/23"]
  }
}

variable "rt_tags" {
  type    = map(string)
  default = null
}

variable "nat_tags" {
  type    = map(string)
  default = null
}

variable "eip_tags" {
  type    = map(string)
  default = null
}

variable "app_subnets_detail" {
  type = object({
    name        = string
    cidr_blocks = list(string)
    tags        = optional(map(string))
  })
  default = {
    name        = "app"
    cidr_blocks = ["10.0.0.0/21", "10.0.8.0/21"]
  }
}

variable "db_subnets_detail" {
  type = object({
    name        = string
    cidr_blocks = list(string)
    tags        = optional(map(string))
  })
  default = {
    name        = "db"
    cidr_blocks = ["10.0.24.0/23", "10.0.26.0/23"]
  }
}

variable "management_subnets_detail" {
  type = object({
    name        = string
    cidr_blocks = list(string)
    tags        = optional(map(string))
  })
  default = {
    name        = "management"
    cidr_blocks = ["10.0.20.0/23", "10.0.22.0/23"]
  }
}

