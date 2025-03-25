resource "aws_security_group" "web_alb_sg" {
  name        = "web-tier-alb-sg-tht" #later change hardcoded names in var
  description = "web-tier-alb-sg-tht"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "web-tier-alb-sg-tht"
    Created_by = "terraform"
  }
}

/*
resource "aws_security_group" "application_alb_sg" {
    name        = "application-tier-alb-sg-tht"
    description = "application-tier-alb-sg-tht"
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        security_groups  = [aws_security_group.web_instance_sg.id]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    tags = {
      Name = "application-tier-alb-sg-tht"
      Created_by = "terraform"
    }
}
*/

resource "aws_security_group" "application_instance_sg" {
  name        = "application-tier-ec2-instance-sg-tht"
  description = "application-tier-ec2-instance-sg-tht"
  vpc_id      = aws_vpc.main.id


  ingress {
    from_port       = 5000 #for a Flask app
    to_port         = 5000
    protocol        = "tcp"
    security_groups = [aws_security_group.web_alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "application-tier-ec2-instance-sg-tht"
    Created_by = "terraform"
  }
}

resource "aws_security_group" "database_sg" {
  name        = "db-tier-postgres-sg-tht"
  description = "db-tier-postgres-sg-tht"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.application_instance_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "db-tier-postgres-sg-tht"
    Created_by = "terraform"
  }
}