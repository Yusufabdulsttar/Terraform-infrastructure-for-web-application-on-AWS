resource "aws_security_group" "public_subnet_sg" {
  name        = "public-subnet-sg"
  description = "Security group for instances in public subnet"
  vpc_id      = var.vpc_id  

  // Ingress rules
  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Egress rules (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_subnet_sg" {
  name        = "private-subnet-sg"
  description = "Security group for instances in private subnet"
  vpc_id      = var.vpc_id

  // Ingress rules (allow HTTP from ALB and SSH from anywhere)
  ingress {
    description     = "Allow HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_subnet_sg.id]
  }

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_security_group" {
  name        = "db_security_group"
  description = "Security group for RDS PostgreSQL database"
  vpc_id      = var.vpc_id  

  // Ingress rules for database access
  ingress {
    description = "Allow PostgreSQL access from EC2 instances"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.private_subnet_sg.id]
  }

  // Egress rules (example: allow outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}