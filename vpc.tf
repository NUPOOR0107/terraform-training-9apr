resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "myvpc-nupoor"
  }
}
/*
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "private_subnet_nupoor"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "public_subnet_nupoor"
  }
}
*/

resource "aws_subnet" "subnet" {
  for_each   = var.subnet
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = each.value.cidr_block

  tags = {
    Name = "${each.key}_nupoor"
  }
}


resource "aws_security_group" "public_sg" {
  name        = "public_sg_nupoor"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = "public_sg_nupoor"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private_sg_nupoor"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr]

  }

  tags = {
    Name = "private_sg_nupoor"
  }
}



