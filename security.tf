#creating secgroup for public access to instances
resource "aws_security_group" "Main_security" {
  name        = "allow_all"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.Main_vpc.id
  #all inbound traffic acception
  ingress {
    description = "all allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #all outbound traffic acception
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_all"
  }
}
#attachinf SG to VPC
  vpc_security_group_ids = [aws_security_group.Main_security.id]

}
