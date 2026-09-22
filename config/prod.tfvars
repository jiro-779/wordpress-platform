aws_region  = "eu-north-1"
environment = "prod"
vpc_cidr    = "10.20.0.0/16"

az_1 = "eu-north-1a"
az_2 = "eu-north-1b"

public_subnet_1_cidr = "10.20.1.0/24"
public_subnet_2_cidr = "10.20.2.0/24"

private_subnet_1_cidr = "10.20.11.0/24"
private_subnet_2_cidr = "10.20.12.0/24"

db_subnet_1_cidr = "10.20.21.0/24"
db_subnet_2_cidr = "10.20.22.0/24"
nat_gateway_count = 2