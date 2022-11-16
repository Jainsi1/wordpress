# INTERNAT GATEWAY CREATION
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wordpressvpc.id

  tags = {
    Name = "Wordpress_igw"
  }
}