resource "aws_route_table" "my_public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public_rt_nupoor"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.subnet["public_subnet"].id
  route_table_id = aws_route_table.my_public_rt.id
}


resource "aws_route_table" "my_private_rt" {
  vpc_id = aws_vpc.my_vpc.id


  tags = {
    Name = "private_rt_nupoor"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.subnet["private_subnet"].id
  route_table_id = aws_route_table.my_private_rt.id
}