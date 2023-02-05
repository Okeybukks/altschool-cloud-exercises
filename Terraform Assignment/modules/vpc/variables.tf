variable "availability-zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public-subnets" {
  default = [
    { tag = "public-subnet-1", cidr = "10.0.1.0/24", az = "us-east-1a" },
    { tag = "public-subnet-2", cidr = "10.0.2.0/24", az = "us-east-1b" },
    { tag = "public-subnet-3", cidr = "10.0.3.0/24", az = "us-east-1c" }
  ]
}
