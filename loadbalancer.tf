
resource "aws_lb" "Wordpresslb" {
  name               = "Wordpresslb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.wp_sg.id]
  subnets            = [aws_subnet.pubsubnet1.id, aws_subnet.pubsubnet2.id]
}

resource "aws_lb_target_group" "target-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.wordpressvpc.id
}