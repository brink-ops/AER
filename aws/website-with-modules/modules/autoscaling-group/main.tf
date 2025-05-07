resource "aws_launch_configuration" "my_lc" {
  name          = "${var.project}-launch-configuration"
    image_id           = "ami-058a8a5ab36292159"
  instance_type = var.instance_type
  security_groups = [var.allow_http]
  associate_public_ip_address = var.add_public_ip
  user_data = file(var.startup_script)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "my_asg" {
  launch_configuration = aws_launch_configuration.my_lc.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [var.subnet_az1, var.subnet_az2]
  load_balancers = [var.my_lb]

  tag {
    key                 = "Name"
    value               = "${var.project}-app-instance"
    propagate_at_launch = true
  }
}
