// Create a VPC with the specified CIDR block
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block_vpc
}

// Create a public subnet within the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr_block_public_subnet
  map_public_ip_on_launch = true
}

// Create a private subnet within the VPC
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block_private_subnet
}

// Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

// Create a public route table for the VPC
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_block_route_table
    gateway_id = aws_internet_gateway.igw.id
  }
}

// Associate the public route table with the private subnet
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}
