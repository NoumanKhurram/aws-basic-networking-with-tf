resource "aws_instance" "web" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  subnet_id                   = aws_subnet.subnets.id
  vpc_security_group_ids      = [aws_security_group.app-web.id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash -ex

  amazon-linux-extras install nginx1 -y
  echo "<h1>This is a new server</h1>" > /usr/share/nginx/html/index.html
  systemctl enable nginx
  systemctl start nginx
  EOF

  tags = {
    Name = var.ec2_instance_name
  }
}