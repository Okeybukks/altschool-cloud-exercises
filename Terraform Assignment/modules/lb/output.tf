output "load-balancer-dns-name" {
  value       = aws_lb.altschool-lb.dns_name
  description = "DNS name of load balancer"
}

output "load-balancer-zone-id" {
  value       = aws_lb.altschool-lb.zone_id
  description = "Zone ID of load balancer"
}



