resource "aws_launch_configuration" "press" {
  name_prefix                 = "word"
  image_id                    = "ami-0a0c73289afc98cb4"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.wp_sg.id]
  associate_public_ip_address = true
}

resource "aws_autoscaling_group" "pressgroup" {
  #availability_zones = ["us-east-2a","us-east-2b"]
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  vpc_zone_identifier       = [aws_subnet.pubsubnet1.id, aws_subnet.pubsubnet2.id]
  launch_configuration      = aws_launch_configuration.press.name
  health_check_type         = "ELB"
}
resource "aws_autoscaling_attachment" "bar" {
  autoscaling_group_name = aws_autoscaling_group.pressgroup.id
  alb_target_group_arn   = aws_lb_target_group.target-elb.arn
}



resource "aws_lb_listener" "App-alb" {
  load_balancer_arn = aws_lb.Wordpresslb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-elb.arn
  }
}