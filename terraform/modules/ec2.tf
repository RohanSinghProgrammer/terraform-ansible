resource "aws_default_vpc" "default_vpc" {
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.env}_ec2_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default_vpc.id

  tags = {
    Name = "${var.env}_ec2_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "ec2_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.ec2_key_name
  security_groups = [aws_security_group.ec2_sg.name]
  count           = var.instance_count
  root_block_device {
    volume_size = var.ebs_size
    volume_type = var.ebs_type
    encrypted   = true
  }

  tags = {
    Name = "${var.env}_ec2_instance-${count.index}"
    env  = var.env
  }
}


