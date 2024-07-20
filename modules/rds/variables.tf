variable "db_instance_identifier" {
  description = "Identifier for the RDS PostgreSQL instance"
  type        = string
}

variable "db_username" {
  description = "Username for accessing the PostgreSQL instance"
  type        = string
}

variable "db_password" {
  description = "Password for accessing the PostgreSQL instance"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet where the RDS instance will be deployed"
  type        = number
}

variable "db_security_group_id" {
  description = "ID of the security group for the RDS instance"
  type        = number
}