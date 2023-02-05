output "public_servers" {
  value = aws_instance.public_server[0].id
}

output "SG_id" {
  value = module.sg.SG_id
}

output "load-balancer-dns-name" {
  value = module.lb
}
