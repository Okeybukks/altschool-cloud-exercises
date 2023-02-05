# VPC RESOURCE
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "altschool-vpc"
  }
}

# VPC SUBNET RESOURCE
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public-subnets[count.index]["cidr"]
  availability_zone = var.public-subnets[count.index]["az"]

  tags = {
    Name = var.public-subnets[count.index]["tag"]
  }

  count = 3
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "altschool-internet-gateway"
  }
}

# VPC PUBLIC ROUTE TABLE
resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "altschool-public-RT"
  }
}

# VPC ROUTE TABLE ASSOCIATION WITH SUBNET
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public-RT.id

  count = 3
}