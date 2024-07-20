output "public_subnet_sg" {
  value = aws_security_group.public_subnet_sg.id
}

output "private_subnet_sg" {
  value = aws_security_group.private_subnet_sg.id
}

output "db_security_group" {
  value = aws_security_group.db_security_group.id
}