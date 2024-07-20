# Terraform AWS Infrastructure Setup

This project provisions an AWS infrastructure for a web application using Terraform. The infrastructure includes:

1. A VPC with two subnets (public and private).
2. An EC2 instance in the private subnet.
3. An RDS PostgreSQL database instance in the private subnet.
4. Security groups to allow traffic between the components and external access to the web server (Allow HTTP (80) and SSH (22) from anywhere in both subnets).
5. IAM Roles and Policies:
   - For EC2 instances to read from an S3 bucket.
   - For Lambda functions to interact with the RDS PostgreSQL database.
6. An Application Load Balancer (ALB).
7. Route 53 to create a custom domain for accessing the web application.
8. A Lambda function that interacts with the RDS PostgreSQL database.
9. API Gateway with a REST API configured to route requests to the Lambda function.

## Project Structure

The project is organized into the following modules:

- `vpc/` - Defines the VPC, subnets, gateways, and route tables.
- `iam/` - Defines IAM roles and policies.
- `alb/` - Defines the Application Load Balancer.
- `api_gateway/` - Defines the API Gateway.
- `ec2/` - Defines the EC2 instance.
- `lambda/` - Defines the Lambda function.
- `rds/` - Defines the RDS PostgreSQL database instance.
- `route53/` - Defines the Route 53 custom domain.
- `s3/` - Defines the S3 bucket.
- `security_groups/` - Defines the security groups.

## Prerequisites

- Terraform installed on your local machine.
- AWS credentials configured (`aws configure`).

## Usage

### 1. Clone the repository

```sh
git clone https://github.com/Yusufabdulsttar/Terraform-infrastructure-for-web-application-on-AWS.git 
cd Terraform-infrastructure-for-web-application-on-AWS
```

### 2. Initialize Terraform
- Initialize the Terraform configuration to install the necessary providers and modules.
```sh
terraform init
```

### 3. Plan the infrastructure
- Run Terraform plan to see the changes that will be applied.
```sh
terraform plan
```

### 4. Apply the infrastructure
- Apply the Terraform configuration to provision the infrastructure.
```sh
terraform apply
```
### 5. Destroy the infrastructure
- To tear down the infrastructure, run:
```sh
terraform destroy
```
