resource "aws_db_instance" "db_instance" {
  identifier            = var.db_instance_identifier
  allocated_storage     = 10  # GB
  storage_type          = "gp2"
  engine                = "postgres"
  engine_version        = "12.4"
  instance_class        = "db.t2.micro"
  username              = var.db_username
  password              = var.db_password
  db_subnet_group_name  = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [var.db_security_group_id]

  tags = {
    Name = var.db_instance_identifier
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [var.private_subnet_id]

  tags = {
    Name = "my-db-subnet-group"
  }
}
