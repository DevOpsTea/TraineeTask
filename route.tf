#creation of routing table
resource "aws_route_table" "tablemain" {
  vpc_id = aws_vpc.Main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Main_route"
  }
}

#subnet to route association
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.psubnet1.id
  route_table_id = aws_route_table.tablemain.id
}
#subnet 2 to route association
resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.psubnet2.id
  route_table_id = aws_route_table.tablemain.id
}
