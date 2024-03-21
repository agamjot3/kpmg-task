

output "ssh_security_group_id" {
  value = module.ssh_security_group.sg_id
}



output "alb_security_group_id" {
  value = module.alb_security_group.sg_id
}

output "pvt_alb_security_group_id" {
  value = module.pvt_alb_security_group.sg_id
}




output "back_end_security_group_id" {
  value = module.back_end_security_group.sg_id
}

output "db_security_group_id" {
  value = module.db_security_group.sg_id
}


output "alb_dns_name" {
  description = "DNS of ALB"
  value       = module.pub_alb.alb_dns_name
}

output "alb_arn" {
  description = "ARN of alb"
  value       = module.pub_alb.alb_arn
}

output "alb_http_listener_arn" {
  description = "ARN of alb http listener"
  value       = module.pub_alb.alb_http_listener_arn
}



output "pvt_alb_dns_name" {
  description = "DNS of ALB"
  value       = module.pvt_alb.alb_dns_name
}

output "pvt_alb_arn" {
  description = "ARN of alb"
  value       = module.pvt_alb.alb_arn
}

output "pvt_alb_http_listener_arn" {
  description = "ARN of alb http listener"
  value       = module.pvt_alb.alb_http_listener_arn
}

