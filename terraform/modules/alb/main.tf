resource "aws_lb" "alb" {
  name = var.alb_name
  load_balancer_type = "application"
  subnets = [
    var.subnet_1,
    var.subnet_2
  ]
  security_groups = [var.alb_sg_id]

  tags = {
    Name = var.alb_tag_name
  }
}



resource "aws_lb_target_group" "blue" {
  name        = "strapi-blue-tg-libin"
  port        = 1337
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}


resource "aws_lb_target_group" "green" {
  name        = "strapi-green-tg-libin"
  port        = 1337
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }
}