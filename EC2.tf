#----------------ec2---------------
#public 배스쳔호스트
resource "aws_instance" "global-public-ec2-a" {
  ami               = var.ec2_ami
  instance_type     = "t2.micro"
  availability_zone = var.az_a
  key_name          = "teamsol-us-west-1"

  subnet_id = aws_subnet.global-public-subnet-a.id
  vpc_security_group_ids = [
    aws_security_group.global-public-sg-bastion.id
  ]
  tags = {
    Name = "global-public-ec2-a"
  }
}

resource "aws_instance" "global-public-ec2-c" {
  ami               = var.ec2_ami
  instance_type     = "t2.micro"
  availability_zone = var.az_c
  key_name          = "teamsol-us-west-1"

  subnet_id = aws_subnet.global-public-subnet-c.id
  vpc_security_group_ids = [
    aws_security_group.global-public-sg-bastion.id
  ]
  tags = {
    Name = "global-public-ec2-c"
  }
}
# AutoScaling Group 시작구성으로 자동구성
# #web
resource "aws_instance" "global-private-ec2-a-web" {
  ami               = var.ec2_ami
  instance_type     = "t2.micro"
  availability_zone = var.az_a

  subnet_id = aws_subnet.global-private-subnet-a-web.id
  vpc_security_group_ids = [
    aws_security_group.global-private-sg-web.id
  ]
  tags = {
    Name = "global-private-ec2-a-web"
  }
}

resource "aws_instance" "global-private-ec2-c-web" {
  ami               = var.ec2_ami
  instance_type     = "t2.micro"
  availability_zone = var.az_c

  subnet_id = aws_subnet.global-private-subnet-c-web.id
  vpc_security_group_ids = [
    aws_security_group.global-private-sg-web.id
  ]
  tags = {
    Name = "global-private-ec2-c-web"
  }
}
