variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type = map(string)

  default = {
    us-east-1 = "ami-00874d747dde814fa" # Ubuntu 20.04 x86
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "domain_name" {
  default = "altschoolminiproject.software"
}
variable "alternative_name" {
  default = "terraform-test.altschoolminiproject.software"
}