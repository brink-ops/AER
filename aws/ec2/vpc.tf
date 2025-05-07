resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet_az1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_a_cidr
  availability_zone = "${var.region}a" # Specify your desired AZ
}

resource "aws_subnet" "subnet_az2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_b_cidr
  availability_zone = "${var.region}b" # Specify your desired AZ
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }
}
