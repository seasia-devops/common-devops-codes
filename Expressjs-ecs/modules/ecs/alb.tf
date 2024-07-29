resource "aws_alb" "app_alb" {
  name               = "elb"
  internal           = false
  load_balancer_type = "application"
  subnets         = var.availability_zones
  security_groups = [aws_security_group.elb_sg.id]

  enable_deletion_protection = false
    tags = {
    Environment = "app_alb"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_alb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.api_target_group2.arn

    }
}

resource "aws_lb_listener" "front_end_1" {
  load_balancer_arn = aws_alb.app_alb.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.api_target_group2.arn

    }
}

resource "aws_alb_target_group" "api_target_group1" {
  name     = "express-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  target_type="ip"
  vpc_id   = var.vpc_id
}

resource "aws_alb_target_group" "api_target_group2" {
  name     = "express-example-lb-tg-1"
  port     = 3000
  protocol = "HTTP"
  target_type="ip"
  vpc_id   = var.vpc_id
}























