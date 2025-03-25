# Application tier
create_ec2_instance = {
  application_server_1a = {
    ami                         = "ami-0b5a4445ada4a59b1"
    instance_type               = "t3.medium"
    subnet                      = "subnet-0eaad472ded329614"
    associate_public_ip_address = false
    key_name                    = "kp-to-be-removed"
    availability_zone           = "ap-southeast-1a"
    security_group              = ["sg-033aaacd12bdc9c9c"]
  }
  application_server_1b = {
    ami                         = "ami-0b5a4445ada4a59b1"
    instance_type               = "t3.medium"
    subnet                      = "subnet-0acdc2d5c3de39b31"
    associate_public_ip_address = false
    key_name                    = "kp-to-be-removed"
    availability_zone           = "ap-southeast-1b"
    security_group              = ["sg-033aaacd12bdc9c9c"]

  }
}

# DB tier
db_identifier     = "banking-db-tht"
db_instance_class = "db.m6g.large"
database_name     = "bankingdb"