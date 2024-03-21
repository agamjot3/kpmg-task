data "aws_availability_zones" "az" {
  state = "available"
}

module "vpc" {
  source        = "../../terraform_modules/vpc"
  name          = var.name
  vpc_details   = var.vpc_details
  pvt_zone_name = var.pvt_zone_name
}

module "nat_gw" {
  source             = "../../terraform_modules/nat_gw"
  name               = var.name
  enable_az_specific = true
  subnets_id         = module.public_subnet.ids
  eip_tags           = var.eip_tags
  nat_tags           = var.nat_tags
}

module "public_subnet" {
  source             = "../../terraform_modules/subnet"
  vpc_id             = module.vpc.vpc_id
  subnet_name        = "${var.name}-${var.pub_subnets_detail.name}"
  availability_zones = local.availability_zones
  subnets_cidr       = var.pub_subnets_detail.cidr_blocks
  tags               = var.pub_subnets_detail.tags
  route_table_id     = module.public_route_table.id

}

module "public_route_table" {
  source = "../../terraform_modules/route_table"
  vpc_id = module.vpc.vpc_id
  name   = "${var.name}-pub"
  tags   = var.rt_tags
  routes = {
    "0.0.0.0/0" = module.vpc.igw_id
  }
}

module "app_subnet" {
  source             = "../../terraform_modules/subnet"
  vpc_id             = module.vpc.vpc_id
  subnet_name        = "${var.name}-${var.app_subnets_detail.name}"
  availability_zones = local.availability_zones
  subnets_cidr       = var.app_subnets_detail.cidr_blocks
  tags               = var.app_subnets_detail.tags
  route_table_ids    = module.pvt_route_table.*.id
}

module "pvt_route_table" {
  source = "../../terraform_modules/route_table"
  count  = length(var.pub_subnets_detail.cidr_blocks)
  vpc_id = module.vpc.vpc_id
  name   = "${var.name}-pvt-${element(split("-", local.availability_zones[count.index]), 2)}"
  tags   = var.rt_tags
  routes = {
    "0.0.0.0/0" = module.nat_gw.nat_gw_id[count.index]
  }
}

module "db_subnet" {
  source             = "../../terraform_modules/subnet"
  vpc_id             = module.vpc.vpc_id
  subnet_name        = "${var.name}-${var.db_subnets_detail.name}"
  availability_zones = local.availability_zones
  subnets_cidr       = var.db_subnets_detail.cidr_blocks
  tags               = var.db_subnets_detail.tags
  route_table_ids    = module.pvt_route_table.*.id
}

module "management_subnet" {
  source             = "../../terraform_modules/subnet"
  vpc_id             = module.vpc.vpc_id
  subnet_name        = "${var.name}-${var.management_subnets_detail.name}"
  availability_zones = local.availability_zones
  subnets_cidr       = var.management_subnets_detail.cidr_blocks
  tags               = var.management_subnets_detail.tags
  route_table_ids    = module.pvt_route_table.*.id
}

