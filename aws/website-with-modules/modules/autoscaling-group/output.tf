output "my_asg" {
  value = aws_autoscaling_group.my_asg.id
}
output "my_lc" {
  value = aws_launch_configuration.my_lc.id
}
