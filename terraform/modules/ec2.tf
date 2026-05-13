resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = file(var.ec2_key)
}

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

resource "aws_ebs_volume" "ec2_storage" {
  availability_zone = var.ebs_az
  size              = var.ebs_size
  type              = var.ebs_type
  count             = var.instance_count
  encrypted         = true

  tags = {
    Name = "${var.env}_ec2_storage-${count.index}"
  }
}

resource "aws_instance" "ec2_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.ec2_key.key_name
  security_groups = [aws_security_group.ec2_sg.name]
  count           = var.instance_count
  tags = {
    Name = "${var.env}_ec2_instance-${count.index}"
    env = var.env
  }
}

resource "aws_volume_attachment" "ec2_storage_attachment" {
  count       = var.instance_count
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ec2_storage[count.index].id
  instance_id = aws_instance.ec2_instance[count.index].id
}


