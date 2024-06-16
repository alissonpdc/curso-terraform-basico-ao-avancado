# ALB
resource "aws_lb" "front_end" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1b.id,
    aws_subnet.public_1c.id
  ]

  tags = {
    Name = "app-alb"
  }
}
resource "aws_lb_target_group" "front_end" {
  name     = "app-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}