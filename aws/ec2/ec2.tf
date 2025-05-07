resource "aws_instance" "test_instance" {
  ami             = "ami-058a8a5ab36292159" # Amazon Linux
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet_az1.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "My_test_Instance"
  }
}
