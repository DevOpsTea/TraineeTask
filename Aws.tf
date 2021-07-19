#Access for terraform
provider "aws" {
  access_key = "AKIAX34XIGAOJEVPKH3F"
  secret_key = "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"
  region     = "us-east-1"
}
#creating VPC
resource "aws_vpc" "Main_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "MainVpc"
  }
}
#Main_GW for VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Main_vpc.id

  tags = {
    Name = "MainGW"
  }
}

#Subnet1 in VPC
resource "aws_subnet" "psubnet1" {
  vpc_id                  = aws_vpc.Main_vpc.id
  cidr_block              = "172.16.10.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet1"
  }
}
#subnet2 in VPC
resource "aws_subnet" "psubnet2" {
  vpc_id                  = aws_vpc.Main_vpc.id
  cidr_block              = "172.16.20.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet2"
  }
}
#instance1
resource "aws_instance" "vm1" {
  ami                    = "ami-077f1edd46ddb3129"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.psubnet1.id
  key_name               = "keypair1"
  vpc_security_group_ids = [aws_security_group.Main_security.id]
}
#instance2
resource "aws_instance" "vm2" {
  ami           = "ami-077f1edd46ddb3129"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.psubnet2.id
  key_name      = "keypair1"
