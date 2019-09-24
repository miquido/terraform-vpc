output "private_subnets" {
  value       = [aws_subnet.private_subnets.*.id]
  description = "IDs of private subnets"
}

output "public_subnets" {
  value       = [aws_subnet.public_subnets.*.id]
  description = "IDs of public subnets"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "IDs of VPC"
}

