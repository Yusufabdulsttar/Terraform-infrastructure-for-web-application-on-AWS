variable "filename" {
  description = "Path to Lambda function code package"
  default = "path.zib"
  type = string
}

variable "function_name" {
  description = "Lambda function"
  type = string
}

variable "handler" {
  description = "Lambda handler"
  type = string
}

variable "runtime" {
  description = "Lambda runtime"
  type = string
}

variable "aws_iam_role" {
  description = "Lambda role"
}


variable "db_instance_identifier" {
  description = "Identifier for the RDS PostgreSQL instance"
}

variable "db_instance_endpoint" {
  description = "db instance endpoint"
}

variable "db_name" {
  description = "Name of the PostgreSQL database"
}

variable "db_username" {
  description = "Username for accessing the PostgreSQL instance"
}

variable "db_password" {
  description = "Password for accessing the PostgreSQL instance"
}

variable "private_subnet" {
  description = "private subnet"
}

variable "security_group_db" {
  description = "security group for rds"
}   