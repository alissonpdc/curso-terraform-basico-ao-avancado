# BASTION HOST
resource "aws_instance" "bastion" {
  ami                    = "ami-08a0d1e16fc3f61ea"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_1a.id
  vpc_security_group_ids = [aws_security_group.bastion.id]

  tags = {
    Name = "bastion-host"
  }
}

# ASG
resource "aws_launch_template" "template" {
  image_id               = "ami-08a0d1e16fc3f61ea"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.asg.id]
}
resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  max_size         = 2
  min_size         = 2

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  vpc_zone_identifier = [
    aws_subnet.private_1a.id,
    aws_subnet.private_1b.id,
    aws_subnet.private_1c.id
  ]

  target_group_arns = [aws_lb_target_group.front_end.arn]
}