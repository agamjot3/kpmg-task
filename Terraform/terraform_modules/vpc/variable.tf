variable "name" {
  type = string
}

variable "vpc_details" {
  type = object({
    cidr_block                = string
    instance_tenancy          = optional(string, "default")
    enable_dns_support        = optional(bool, true)
    enable_dns_hostnames      = optional(bool, true)
    vpc_tags                  = optional(map(string))
    vpc_flow_log_dest         = optional(string)
    vpc_flow_log_path         = optional(string, "vpc-flow-log")
    vpc_flow_log_dest_type    = optional(string, "s3")
    vpc_flow_log_traffic_type = optional(string, "ALL")
    create_igw                = optional(bool, true)
    igw_tags                  = optional(map(string))
  })
}

variable "pvt_zone_name" {
  type = string
}