#EC2
variable "create_ec2_instance" {
  type = any
}

#RDS
variable "db_identifier" {
  type        = string
  description = "This is a variable for DB Identifier"
}

variable "db_instance_class" {
  type        = string
  description = "This is a variable for DB Instance class"
}

variable "database_name" {
  type        = string
  description = "This is a variable for DB Name"
}

variable "deletion_protection" {
  type        = bool
  description = "This is a variable for DB deletion protection"
  default     = true
}