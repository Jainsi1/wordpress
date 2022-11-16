# Public Route Table

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.wordpressvpc.id
  tags = {
    Name = "PublicRoute"
  }
}

# Private Route Table

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.wordpressvpc.id


  tags = {
    Name = "PrivateRoute"
  }
}