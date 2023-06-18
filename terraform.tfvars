aws_region="eu-west-1"
environment="Test"
# /24 last number - 10.0.0.1 - 10.0.0.254
# /16 last two numbers - 10.0.0.1 - 10.0.255.254
# /8 last three numbers - 10.0.0.1 - 10.255.255.254
main_vpc_cidr="10.0.0.0/16"
subnet_cidr="10.0.1.0/24"
vpc_name="Test-VPC"
igw_name="Test-InternetGateway"
subnet_name="Test-subnet"
route_table_name = "Test-route-table"
# Amazon linux 2
ec2_ami="ami-0d499daa694cb80e3"
ec2_instance_type="t2.micro"
ec2_instance_name="Test-Instance"
