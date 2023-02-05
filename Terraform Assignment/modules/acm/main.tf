# AWS PROVIDER FOR ACM RESOURCE CREATION
provider "aws" {
  profile = "myprofile"
  region  = var.region
}

# AWS CERTIFICATE RESOURCE
resource "aws_acm_certificate" "alt-cert" {
  domain_name               = "achebeokechukwu.space"
  subject_alternative_names = ["terraform-test.achebeokechukwu.space"]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Environment = "altschool-certificate"
  }
}

# ROUTE53 HOSTED ZONE DATA
data "aws_route53_zone" "hosted_zone" {
  name = "achebeokechukwu.space"
  private_zone = false
}

# ROUTE53 RECORD FOR THE CERTIFICATE
resource "aws_route53_record" "cert-record" {
  for_each = {
    for dvo in aws_acm_certificate.alt-cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.hosted_zone.zone_id
}


# CERTIFICATE VALIDATION RESOURCE
resource "aws_acm_certificate_validation" "cert-validation" {
  certificate_arn         = aws_acm_certificate.alt-cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert-record : record.fqdn]
}

# LOAD BALANCER DATA
data "aws_lb" "altschool-lb" {
  name = "altschool-lb"
}


# LOAD BALANCER TARGET GROUP DATA
data "aws_lb_target_group" "target-group" {
  name = "altschool-lb-target-group"
}

# LOAD BALANCER LISTENER FOR HTTPS CONNECTION
resource "aws_alb_listener" "alb-listener-https" {
  depends_on = [
    aws_acm_certificate.alt-cert,
    aws_route53_record.cert-record,
    aws_acm_certificate_validation.cert-validation
  ]
  load_balancer_arn = data.aws_lb.altschool-lb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.alt-cert.arn
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    target_group_arn = data.aws_lb_target_group.target-group.arn
    type             = "forward"
  }
}

# LOAD BALANCER LISTENER FOR HTTP CONNECTION

resource "aws_lb_listener" "alb-listener-http" {
  load_balancer_arn = data.aws_lb.altschool-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}