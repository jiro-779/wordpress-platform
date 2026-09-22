output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

output "db_subnet_ids" {
  value = [
    aws_subnet.db_1.id,
    aws_subnet.db_2.id
  ]
}

output "kms_key_arn" {
  description = "ARN of the WordPress KMS key"
  value       = aws_kms_key.wordpress.arn
}