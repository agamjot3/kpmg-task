output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC-ID of network skeleton"
}
output "igw_id" {
  value       = aws_internet_gateway.igw.0.id
  description = "IGW-ID of network skeleton"
}

output "route53_zone_id" {
  value = aws_route53_zone.private_hosted_zone.*.id
}

output "route53_name" {
  value = aws_route53_zone.private_hosted_zone.*.name
}

