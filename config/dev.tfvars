aws_region  = "eu-north-1"
environment = "dev"
vpc_cidr    = "10.10.0.0/16"

az_1 = "eu-north-1a"
az_2 = "eu-north-1b"

public_subnet_1_cidr = "10.10.1.0/24"
public_subnet_2_cidr = "10.10.2.0/24"

private_subnet_1_cidr = "10.10.11.0/24"
private_subnet_2_cidr = "10.10.12.0/24"

db_subnet_1_cidr = "10.10.21.0/24"
db_subnet_2_cidr = "10.10.22.0/24"
nat_gateway_count = 1