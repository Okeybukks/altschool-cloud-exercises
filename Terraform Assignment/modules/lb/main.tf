# TARGET GROUP RESOURCE FOR THE LOAD BALANCER
resource "aws_lb_target_group" "target-group" {
  name        = "altschool-lb-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 10
  }
}

# TARGET GROUP ATTACHMENT FOR PUBLIC SERVERS
resource "aws_lb_target_group_attachment" "public-target-attachment1" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = var.instance_id_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "public-target-attachment2" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = var.instance_id_2
  port             = 80
}

resource "aws_lb_target_group_attachment" "public-target-attachment3" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = var.instance_id_3
  port             = 80
}

# LOAD BALANCER RESOURCE
resource "aws_lb" "altschool-lb" {
  name               = "altschool-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.SG_id]
  subnets            = var.subnets


  tags = {
    Environment = "altschool-lb"
  }
}

# ROUTE53 HOSTED ZONE RESOURCE
resource "aws_route53_zone" "hosted-zone" {
  name = "achebeokechukwu.space"

  tags = {
    Environment = "terraform-test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ROUTE53 RECORD A RESOURCE FOR THE DOMAIN NAME 
resource "aws_route53_record" "terraform-test" {
  zone_id = aws_route53_zone.hosted-zone.zone_id
  name    = "terraform-test.achebeokechukwu.space"
  type    = "A"
  alias {
    name                   = aws_lb.altschool-lb.dns_name
    zone_id                = aws_lb.altschool-lb.zone_id
    evaluate_target_health = true
  }
}






