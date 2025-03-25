resource "aws_instance" "application_servers" {
  for_each                    = var.create_ec2_instance
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  subnet_id                   = each.value.subnet
  associate_public_ip_address = each.value.associate_public_ip_address
  key_name                    = each.value.key_name
  availability_zone           = each.value.availability_zone
  vpc_security_group_ids      = each.value.security_group

  tags = {
    Name       = "${each.key}_tht"
    Created_by = "terraform"
  }
}


# ASG code
/*
resource "aws_launch_template" "application_instance" {
    name_prefix     = "app-"
    image_id        = var.image_id
    instance_type   = var.instance_type
    lifecycle {
        create_before_destroy = true
    }

}

resource "aws_autoscaling_group" "application_asg" {
    name_prefix          = "app-"
    desired_capacity     = 1
    min_size             = 1
    max_size             = 2
    availability_zones   = ["ap-southeast-1a", "ap-southeast-1b"]

    launch_template {
    id = aws_launch_template.application_instance.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "application_asg_policy" {
    name                   = "application-tier-asg-policy-tht"
    policy_type            = "TargetTrackingScaling"
    autoscaling_group_name = aws_autoscaling_group.application_asg.name

    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type = "ASGAverageCPUUtilization"
        }

        target_value = 70.0
    }
}
*/