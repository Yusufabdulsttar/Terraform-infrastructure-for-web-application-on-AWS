variable "vpc_id" {
  description = "The VPC ID where the ALB will be deployed"
  type        = string
}

variable "public_subnet_id" {
  description = "The public subnet ID where the ALB will be deployed"
  type        = string
}

variable "alb_security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "ec2_instance_id" {
  description = "The ID of the EC2 instance to attach to the ALB"
  type        = string
}