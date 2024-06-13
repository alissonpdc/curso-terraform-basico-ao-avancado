# APP VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "app-vpc"
  }
}
################

# PUBLIC SUBNETS
resource "aws_subnet" "public-1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-1a"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "public-1b"
  }
}

resource "aws_subnet" "public-1c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public-1c"
  }
}
###############


# PRIVATE SUBNETS
resource "aws_subnet" "private-1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-1a"
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-1b"
  }
}

resource "aws_subnet" "private-1c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.30.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private-1c"
  }
}
###############