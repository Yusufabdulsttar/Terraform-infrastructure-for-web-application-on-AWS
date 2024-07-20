output "role_name" {
  value = aws_iam_role.ec2_role.name
}

output "aws_iam_role_lambda" {
  value = aws_iam_role.lambda_role.arn
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}