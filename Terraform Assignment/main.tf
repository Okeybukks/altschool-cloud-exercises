# PROVIDER FOR THE TERRAFORM RESOURCES.
provider "aws" {
  profile = "myprofile"
  region  = var.region
}

# VPC RESOURCE
module "vpc" {
  source = "./modules/vpc"
}

# SECURITY GROUP RESOURCE
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

# PUBLIC INSTANCE RESOURCE
resource "aws_instance" "public_server" {
  ami                         = lookup(var.ami, var.region)
  security_groups             = [module.sg.SG_id]
  subnet_id                   = module.vpc.public_subnet_ids[count.index]
  instance_type               = var.instance_type
  associate_public_ip_address = true

  provisioner "local-exec" {

    command = "echo 'ubuntu-machine-${count.index + 1} ansible_host=${self.public_ip}' ansible_ssh_user=ubuntu ansible_ssh_private_key_file=myKey.pem' >> ansible-folder/host-inventory"
  }
  tags = {
    Name : "public_server_${count.index + 1}"
  }
  key_name = aws_key_pair.key-pair.id

  count = 3

  lifecycle {
    create_before_destroy = true
  }

}

# SECURITY KEY RESOURCE
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key-pair" {
  key_name   = "myKey"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > .aws-key/myKey.pem"
  }
}

# LOAD BALANCER RESOURCE
module "lb" {

  source        = "./modules/lb"
  vpc_id        = module.vpc.vpc_id
  SG_id         = module.sg.SG_id
  subnets       = [for subnet in module.vpc.public_subnet_ids : subnet]
  instance_id_1 = aws_instance.public_server[0].id
  instance_id_2 = aws_instance.public_server[1].id
  instance_id_3 = aws_instance.public_server[2].id
}


