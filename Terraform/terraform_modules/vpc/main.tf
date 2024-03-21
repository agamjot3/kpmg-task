resource "aws_vpc" "main" {
  cidr_block           = var.vpc_details.cidr_block
  instance_tenancy     = var.vpc_details.instance_tenancy
  enable_dns_support   = var.vpc_details.enable_dns_support
  enable_dns_hostnames = var.vpc_details.enable_dns_hostnames

  tags = merge(
    {
      "Name" = format("%s-vpc", var.name)
    },
    var.vpc_details.vpc_tags,
  )
}
resource "aws_flow_log" "vpc_flow_logs" {
  count                = var.vpc_details.vpc_flow_log_dest != null ? 1 : 0
  log_destination      = "${var.vpc_details.vpc_flow_log_dest}/${var.vpc_details.vpc_flow_log_path}"
  log_destination_type = var.vpc_details.vpc_flow_log_dest_type
  traffic_type         = var.vpc_details.vpc_flow_log_traffic_type
  vpc_id               = aws_vpc.main.id
}
resource "aws_internet_gateway" "igw" {
  count  = var.vpc_details.create_igw ? 1 : 0
  vpc_id = aws_vpc.main.id
  tags = merge(
    {
      "Name" = format("%s-igw", var.name)
    },
    var.vpc_details.igw_tags,
  )
}

resource "aws_route53_zone" "private_hosted_zone" {
  name = var.pvt_zone_name
  vpc {
    vpc_id = aws_vpc.main.id
  }
}