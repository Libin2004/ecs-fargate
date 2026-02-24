output "service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.service.name
}

output "service_arn" {
  description = "ECS Service ARN"
  value       = aws_ecs_service.service.arn
}

