output "vpc_id" {
  value = module.vpc.vpc_id
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "pub_subnet_ids" {
  value = module.public_subnet.ids
}

output "app_subnet_ids" {
  value = module.app_subnet.ids
}

output "db_subnet_ids" {
  value = module.db_subnet.ids
}

output "eip_ips" {
  value = module.nat_gw.*.nat_ip
}

output "management_subnet_ids" {
  value = module.management_subnet.ids
}

output "route53_zone_id" {
  value = module.vpc.route53_zone_id
}

output "route53_name" {
  value = module.vpc.route53_name
}

