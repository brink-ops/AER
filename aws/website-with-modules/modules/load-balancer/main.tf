resource "aws_elb" "my_lb" {
  name               = "app-load-balancer"
  internal           = false
  security_groups    = [var.allow_http]
  subnets            = [var.subnet_az1, var.subnet_az2]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 5
    target              = "HTTP:80/"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}
