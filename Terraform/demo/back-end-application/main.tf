resource "aws_key_pair" "be-pem" {
  key_name   = format("%s", "${var.key_name}-be-key")
  public_key = var.be_public_key
}

module "be-ha-ec2-alb" {
  source                         = "../../terraform_modules/terraform-aws-ha-ec2-alb"
  applicaton_name                = var.application_name
  env_name                       = var.env_name
  applicaton_port                = 80
  applicaton_health_check_target = "/"
  tg_protocol                    = "HTTP"
  healthy_threshold_target       = 5
  deregistration_delay           = 60

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  listener_arn                        = data.terraform_remote_state.resources.outputs.pvt_alb_http_listener_arn
  priority                            = "100"
  listener_rule_condition             = "host-header"
  listener_rule_condition_values_host = var.listener_rule_condition_values_host
  listener_rule_condition_values_path = var.listener_rule_condition_values_path

  iam_instance_profile_arn = "arn:aws:iam::279086185000:instance-profile/ec2-admin"


  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  instance_key_name       = aws_key_pair.be-pem.key_name
  security_groups         = [data.terraform_remote_state.resources.outputs.back_end_security_group_id,data.terraform_remote_state.resources.outputs.ssh_security_group_id]
  volume_size             = var.volume_size
  volume_encryption       = var.volume_encryption
  volume_type             = "gp3"
  userdata_path           = var.userdata_path
  instance_subnets        = [data.terraform_remote_state.network.outputs.app_subnet_ids[0], data.terraform_remote_state.network.outputs.app_subnet_ids[1]]
  launch_template_version = "$Latest"

  asg_health_check_type         = "ELB"
  asg_wait_for_elb_capacity     = 0
  asg_health_check_grace_period = 600
  stickiness_enabled            = false
  asg_min_size                  = var.asg_min_size
  asg_max_size                  = var.asg_max_size
  asg_desired_size              = var.asg_desired_size
  asg_tags                      = var.tags

}

resource "aws_autoscaling_policy" "be-asg-policy" {
  name                      = "prod-be-asg-policy"
  adjustment_type           = "ChangeInCapacity"
  enabled                   = var.asg_policy_state
  autoscaling_group_name    = module.be-ha-ec2-alb.asg_name
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = "120"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = "60"
  }
}

resource "aws_autoscaling_policy" "be_mem_policy_up" {
  name                   = "prod-be-asg-mem-policy-up"
  policy_type            = "StepScaling"
  adjustment_type        = "ChangeInCapacity"
  enabled                = var.asg_policy_state
  autoscaling_group_name = module.be-ha-ec2-alb.asg_name
  step_adjustment {
    scaling_adjustment          = 1
    metric_interval_lower_bound = "0"
    metric_interval_upper_bound = ""
  }
}

resource "aws_cloudwatch_metric_alarm" "be_mem_alarm_up" {
  alarm_name          = "prod-be-asg-mem-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "MemoryUtilization"
  namespace           = "CWAgent"
  period              = "120"
  statistic           = "Average"
  threshold           = "90"

  dimensions = {
    AutoScalingGroupName = module.be-ha-ec2-alb.asg_name
  }

  
}

resource "aws_autoscaling_policy" "be_mem_policy_down" {
  name                   = "prod-be-asg-mem-policy-down"
  policy_type            = "StepScaling"
  adjustment_type        = "ChangeInCapacity"
  enabled                = var.asg_policy_state
  autoscaling_group_name = module.be-ha-ec2-alb.asg_name
  step_adjustment {
    scaling_adjustment          = -1
    metric_interval_lower_bound = ""
    metric_interval_upper_bound = "0"
  }

}

resource "aws_cloudwatch_metric_alarm" "be_mem_alarm_down" {
  alarm_name          = "prod-be-asg-mem-down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "MemoryUtilization"
  namespace           = "CWAgent"
  period              = "120"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    AutoScalingGroupName = module.be-ha-ec2-alb.asg_name
  }

  
}

resource "aws_autoscaling_policy" "be_disk_policy_up" {
  name                   = "prod-be-asg-disk-policy-up"
  policy_type            = "StepScaling"
  adjustment_type        = "ChangeInCapacity"
  enabled                = var.asg_policy_state
  autoscaling_group_name = module.be-ha-ec2-alb.asg_name
  step_adjustment {
    scaling_adjustment          = 1
    metric_interval_lower_bound = "0"
    metric_interval_upper_bound = ""
  }

}

resource "aws_cloudwatch_metric_alarm" "be_disk_alarm_up" {
  alarm_name          = "prod-be-asg-disk-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "DiskUtilization"
  namespace           = "CWAgent"
  period              = "120"
  statistic           = "Average"
  threshold           = "90"

  dimensions = {
    AutoScalingGroupName = module.be-ha-ec2-alb.asg_name
  }

  
}