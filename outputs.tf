output "vpc_id" {
    description = "ID of the vpc provisioned"
    value = aws_vpc.main.id
}

output "vpc_arn" {
    description = "ARN of the vpc provisioned"
    value = aws_vpc.main.arn
}

output "application_server_names" {
    description = "Name of the application servers"
    value = values(aws_instance.application_servers)[*].name
}

output "application_server_arns" {
    description = "ARN of the application servers"
    value = values(aws_instance.application_servers)[*].ARN
}

output "db_subnet_group_id" {
    description = "The DB subnet group id"
    value = aws_db_subnet_group.default.id
}

output "db_subnet_group_arn" {
    description = "The DB subnet group arn"
    value = aws_db_subnet_group.default.arn
}

output "db_instance_arn" {
    description = "The DB instance arn"
    value = aws_db_instance.postgres.arn
}

output "db_instance_endpoint" {
    description = "The DB instance endpoint"
    value = aws_db_instance.postgres.endpoint
}

output "web_alb_arn" {
    description = "The ARN of Public Application load balancer"
    value = aws_lb.web_tier_lb.arn
}


