resource "aws_lb" "web_tier_lb" {
  name               = "${local.alb_name}-tht"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_alb_sg.id]
  subnets            = local.alb_subnets

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true
  tags = {
    Name       = "${local.alb_name}-tht"
    Created_by = "terraform"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_tier_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      message_body = "Welcome to the ALB!"
    }
  }
}

resource "aws_lb_target_group" "target_group_1" {
  name     = "${local.alb_name}-tg1-tht"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  tags = {
    Name       = "${local.alb_name}-tg1-tht"
    Created_by = "terraform"
  }
}

resource "aws_lb_target_group" "target_group_2" {
  name     = "${local.alb_name}-tg2-tht"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  tags = {
    Name       = "${local.alb_name}-tg2-tht"
    Created_by = "terraform"
  }
}

resource "aws_lb_target_group_attachment" "app_server_attachment_1" {
  target_group_arn = aws_lb_target_group.target_group_1.arn
  target_id        = local.alb_targets[0]
  port             = 5000
}

resource "aws_lb_target_group_attachment" "app_server_attachment_2" {
  target_group_arn = aws_lb_target_group.target_group_2.arn
  target_id        = local.alb_targets[1]
  port             = 5000
}