ami_image_name = "ami-0b8b44ec9a8f90422" # ubuntu image
instance_type  = "t2.micro"
ec2_name       = ["na1", "na2"]
subnet = {
  public_subnet = {
    cidr_block = "10.0.2.0/24"
  },

  private_subnet = {
    cidr_block = "10.0.1.0/24"
  }
}

inbound_rules = {
  allow_http = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  allow_ssh = {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

create_ec2_instance = {
  public_vm = {
    ami                         = "ami-0b8b44ec9a8f90422"
    instance_type               = "t2.micro"
    subnet                      = "public_subnet"
    associate_public_ip_address = true
    key_name                    = "nupoor-public"
    availability_zone           = "us-east-2b"
    security_group              = "public_sg"
  }
  private_vm = {
    ami                         = "ami-0b8b44ec9a8f90422"
    instance_type               = "t2.micro"
    subnet                      = "private_subnet"
    associate_public_ip_address = false
    key_name                    = "nupoor-public"
    availability_zone           = "us-east-2a"
    security_group              = "private_sg"

  }
}
