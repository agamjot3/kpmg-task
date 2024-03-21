resource "aws_lb" "alb" {
  name                       = var.alb_name
  internal                   = var.internal
  load_balancer_type         = "application"
  security_groups            = var.security_groups_id
  subnets                    = var.subnets_id
  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    {
      "Name" = format("%s", var.alb_name)
    },
    var.tags,
  )

  dynamic "access_logs" {
    for_each = var.enable_logging == true ? local.access_logs_info : []
    iterator = logs_value
    content {
      bucket  = logs_value.value.bucket
      prefix  = logs_value.value.prefix
      enabled = logs_value.value.enabled
    }
  }
}

locals {
  access_logs_info = [
    {
      bucket  = var.logs_bucket
      prefix  = format("%s-alb", var.alb_name)
      enabled = var.enable_logging
    }
  ]
}

resource "aws_alb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}


