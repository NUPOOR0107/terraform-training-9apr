variable "instance_type" {
  type        = string
  description = "This is a variable for Instance type"
}

variable "image_id" {
  type        = string
  description = "This is a variable for AMI ID"
}

variable "create_ec2_instance" {
  type = any
}
