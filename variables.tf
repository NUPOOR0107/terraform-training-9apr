variable "ami_image_name" {

  default = "ami-0900fe555666598a2"

  type = string

  description = "This is a variable for AMI image"

}

variable "instance_type" {

  type        = string
  description = "This is a variable for Instance type"
}

variable "vpc_cidr" {
  type        = string
  description = "This is a variable for vpc cidr"
  default     = "10.0.0.0/16"

}

variable "private_subnet_cidr" {
  type        = string
  description = "This is a variable for private subnet cidr"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {

  type        = string
  description = "This is a variable for public subnet cidr"
  default     = "10.0.2.0/24"
}

variable "ec2_name" {
  type        = set(string)
  description = "name of instances"

}

variable "subnet" {
  type = any
}

variable "inbound_rules" {
  type = any
}

variable "create_ec2_instance" {
  type = any
}

