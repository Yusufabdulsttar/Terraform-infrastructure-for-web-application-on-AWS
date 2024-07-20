resource "aws_instance" "main" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  security_groups = [var.security_Group_id]

  iam_instance_profile = var.aws_iam_instance_profile
}
