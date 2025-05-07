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
resource "aws_internet_gateway" "my_igw" {
     vpc_id = aws_vpc.my_vpc.id
}
resource "aws_route_table" "my_vpc_route_table" {
     vpc_id = aws_vpc.my_vpc.id
   }

resource "aws_route_table_association" "subnet_az1_association" {
     subnet_id      = aws_subnet.subnet_az1.id
     route_table_id = aws_route_table.my_vpc_route_table.id
   }

resource "aws_route_table_association" "subnet_az2_association" {
     subnet_id      = aws_subnet.subnet_az2.id
     route_table_id = aws_route_table.my_vpc_route_table.id
   }

resource "aws_route" "internet_access" {
     route_table_id         = aws_route_table.my_vpc_route_table.id
     destination_cidr_block = "0.0.0.0/0"
     gateway_id             = aws_internet_gateway.my_igw.id
}
