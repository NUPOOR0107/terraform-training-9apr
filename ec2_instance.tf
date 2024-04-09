resource "aws_instance" "myserver" {
  for_each = var.create_ec2_instance
  /*
  ami                         = var.ami_image_name
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet["public_subnet"].id
  associate_public_ip_address = true
  key_name                    = "nupoor-public"
  availability_zone           = "us-east-2c"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  */
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  subnet_id                   = aws_subnet.subnet[each.value.subnet].id
  associate_public_ip_address = each.value.associate_public_ip_address
  key_name                    = each.value.key_name
  availability_zone           = each.value.availability_zone
  #vpc_security_group_ids      = [aws_security_group.public_sg.id]
  vpc_security_group_ids = [lookup(local.sg, each.value.security_group)]


  user_data = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Nupoor public VM</h1></body></html>" > /var/www/html/index.html
        EOF
  tags = {
    Name        = "my_public_server_nupoor_${each.key}"
    Environment = "test"
  }
}
/*
resource "aws_instance" "myserver_private" {
  ami                    = var.ami_image_name
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet["private_subnet"].id
  key_name               = "nupoor-public"
  availability_zone      = "us-east-2c"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  user_data              = <<-EOF
        #!/bin/bash
         #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name        = "my_private_server_nupoor"
    Environment = "test"
  }
}
*/
