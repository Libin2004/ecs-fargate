output "blue_tg_name" {
value = aws_lb_target_group.blue.name
}

output "green_tg_name" {
value = aws_lb_target_group.green.name
}

output "blue_tg_arn" {
value = aws_lb_target_group.blue.arn
}

output "green_tg_arn" {
value = aws_lb_target_group.green.arn
}

output "prod_listener_arn" {
value = aws_lb_listener.http.arn
}

output "test_listener_arn" {
value = aws_lb_listener.test.arn
}

output "alb_dns_name" {
value = aws_lb.alb.dns_name
}
