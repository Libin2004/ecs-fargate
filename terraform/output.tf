output "alb_dns" {
  description = "ALB DNS name to access the app"
  value       = module.alb.alb_dns_name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = module.ecs.service_name
}

output "cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.cluster.name
}