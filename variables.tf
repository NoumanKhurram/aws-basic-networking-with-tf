variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "main_vpc_cidr" {
  type        = string
  description = "VPC cidr"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet range"
}

variable "ec2_ami" {
  type        = string
  description = "Amazon Machine Image id"
}

variable "ec2_instance_name" {
  type        = string
  description = "Name of EC2 instance"
}

variable "ec2_instance_type" {
  type        = string
  description = "Type of EC2 instance"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet Name"
}

variable "igw_name" {
  type        = string
  description = "Name of EC2 instance"
}

variable "route_table_name" {
  type        = string
  description = "Route table Name"
}

