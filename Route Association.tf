#  Associating Public Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id      = aws_subnet.pubsubnet1.id
  route_table_id = aws_route_table.public_route.id
}

# Associating Public Route Table

resource "aws_route_table_association" "rt2" {
  subnet_id      = aws_subnet.pubsubnet2.id
  route_table_id = aws_route_table.public_route.id
}

# Associating Private Route Table 
resource "aws_route_table_association" "private1_association" {
  subnet_id      = aws_subnet.privatesubnet1.id
  route_table_id = aws_route_table.private_route.id
}
resource "aws_route_table_association" "private2_association" {
  subnet_id      = aws_subnet.privatesubnet2.id
  route_table_id = aws_route_table.private_route.id
}