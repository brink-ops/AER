output "my_lb" {
  value = aws_elb.my_lb.id
}
output "alb_dns_name" {
     value = aws_elb.my_lb.dns_name
   }
