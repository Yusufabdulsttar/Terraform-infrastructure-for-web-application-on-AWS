# Module for VPC setup
module "vpc" {
  source = "./modules/vpc"
  cidr_block_vpc = "10.0.0.0/16"
  cidr_block_public_subnet = "10.0.1.0/24"
  cidr_block_private_subnet = "10.0.2.0/24"
  cidr_block_route_table = "0.0.0.0/0"
}

# Module for Security Group setup
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

# Module for EC2 instance setup
module "ec2" {
  source = "./modules/ec2"
  private_subnet_id = module.vpc.private_subnet_id
  security_Group_id = module.security_group.private_subnet_sg
  aws_iam_instance_profile = module.iam.instance_profile_name
}

# Module for IAM setup
module "iam" {
  source = "./modules/iam" 
  bucket_arn = module.s3.bucket_arn
}

# Module for S3 Bucket setup
module "s3" {
  source        = "./modules/s3"
  bucket_name   = "my-s3-ex-bucket" 
}

# Module for RDS PostgreSQL setup
module "rds" {
  source             = "./modules/rds"
  db_instance_identifier = "my-db-instance"
  db_username        = "admin"
  db_password        = "password"
  private_subnet_id  = module.vpc.private_subnet_id
  db_security_group_id = module.security_group.db_security_group
}

# Module for ALB setup
module "alb" {
  source = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_id
  alb_security_group_id = module.security_group.public_subnet_sg
  ec2_instance_id = module.ec2.instance_id
}

# Module for Route53 setup
module "route53" {
  source = "./modules/route53"
  domain = "www.example.com"
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id = module.alb.alb_zone_id
}

# Module for lambda setup
module "lambda" {
  source = "./modules/lambda"
  aws_iam_role = module.iam.aws_iam_role_lambda
  function_name = "Example"
  db_instance_identifier = module.rds.db_instance_id
  db_instance_endpoint = module.rds.db_instance_endpoint
  db_name        = module.rds.db_name 
  db_username    = module.rds.db_username
  db_password    = module.rds.db_password
  handler = "index.handler"
  runtime = "nodejs14.x"
  security_group_db = module.security_group.db_security_group
  private_subnet = module.vpc.private_subnet_id
}

# Module for API Gateway with a REST API for lambda
module "api_gateway" {
  source              = "./modules/api_gateway"
  lambda_function_name = module.lambda.lambda_function_name
  lambda_function_arn  = module.lambda.lambda_function_arn
  region               = var.region
}