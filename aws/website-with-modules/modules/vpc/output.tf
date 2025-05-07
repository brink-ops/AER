output "my_vpc" {
  value = aws_vpc.my_vpc.id
}
output "subnet_az1" {
  value = aws_subnet.subnet_az1.id
}
output "subnet_az2" {
  value = aws_subnet.subnet_az2.id
}
