output "launch_template_name" {
  value = module.fe-ha-ec2-alb.launch_template_name
}
output "launch_template_default_version" {
  value = module.fe-ha-ec2-alb.launch_template_default_version
}
output "launch_template_latest_version" {
  value = module.fe-ha-ec2-alb.launch_template_latest_version
}
output "target_group_arn" {
  value = module.fe-ha-ec2-alb.target_group_arn
}