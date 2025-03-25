locals {
  alb_subnets = [
    "subnet-0cdad529103a64785",
    "subnet-0d20c3fa8b4a38ff3"
  ]

  db_subnets = [
    "subnet-0eaad472ded329614",
    "subnet-0acdc2d5c3de39b31"
  ]

  alb_name = "web-tier-alb"
  alb_targets = [
    "i-08123d28bd6affc62",
    "i-07f7a854143689f88"
  ]

  db_username = "thtadmin"
  db_password = "thtpasss"
}