# VPC
resource "aws_vpc" "main" {
  cidr_block       = var.main_vpc_cidr     # Defining the CIDR block use 10.0.0.0/24 for demo
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id =  aws_vpc.main.id               # vpc_id will be generated after we create VPC

  tags = {
    Name = var.igw_name
  }
}

# Create a Public Subnets.
resource "aws_subnet" "subnets" {
  vpc_id =  aws_vpc.main.id
  cidr_block = var.subnet_cidr       # CIDR block of public subnets

  tags = {
    Name = var.subnet_name
  }
}

# Route table
resource "aws_route_table" "rt" {
  vpc_id =  aws_vpc.main.id
    
  route {
    cidr_block = "0.0.0.0/0"               # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

# Route table Association with Subnet's
resource "aws_route_table_association" "rt-subnet-association" {
  subnet_id = aws_subnet.subnets.id
  route_table_id = aws_route_table.rt.id
}

# Security Group
resource "aws_security_group" "app-web" {
  name = "HTTP"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}