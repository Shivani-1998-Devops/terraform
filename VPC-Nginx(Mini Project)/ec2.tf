resource "aws_instance" "web" {
  ami                         = "ami-0880bf9508ddc7bab"
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"
  }
  tags = merge(local.common_tags, {
    Name = "ec2_instance"
  })
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_security_group" "web_sg" {
  description = "Allow HTTP and SSH traffic"
  name        = "web_sg"
  vpc_id      = aws_vpc.main_vpc.id
  tags = merge(local.common_tags, {
    Name = "web_sg_security_group"
  })
}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "https" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}