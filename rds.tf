resource "random_password" "admin_password" {
  length  = 12
  special = false
}


resource "aws_db_subnet_group" "default" {
  name       = "rds-postgres-subnet-group-tht"
  subnet_ids = local.db_subnets

  tags = {
    Name       = "rds-postgres-subnet-group-tht"
    Created_by = "terraform"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = var.db_identifier
  engine                 = "postgres"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  db_name                = var.database_name
  username               = local.db_username
  password               = local.db_password #random_password.admin_password.result
  vpc_security_group_ids = [aws_security_group.database_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
  multi_az               = false
  publicly_accessible    = false
  deletion_protection    = var.deletion_protection

  tags = {
    Name       = var.db_identifier
    Created_by = "terraform"
  }
}