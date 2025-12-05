output "instance_ids" {
  description = "EC2 instance IDs"
  value       = aws_instance.main[*].id
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.instance.id
}
