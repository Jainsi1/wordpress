# Vpc creation
resource "aws_vpc" "wordpressvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    "name" = "WordpressVPC"
  }
}


#Public subnet 1
resource "aws_subnet" "pubsubnet1" {
  vpc_id            = aws_vpc.wordpressvpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Pubsubnet1"
  }
}

#Public subnet 2
resource "aws_subnet" "pubsubnet2" {
  vpc_id            = aws_vpc.wordpressvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Pubsubnet2"
  }
}

#Private subnet 1
resource "aws_subnet" "privatesubnet1" {
  vpc_id            = aws_vpc.wordpressvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Privatesubnet1"
  }

}

#private subnet 2
resource "aws_subnet" "privatesubnet2" {
  vpc_id            = aws_vpc.wordpressvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Privatesubnet2"
  }
}