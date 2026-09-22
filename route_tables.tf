# -------------------------
# PUBLIC ROUTE TABLE
# -------------------------

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-public-rt"
    Environment = var.environment
    Project     = "wordpress"
  }
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}


# -------------------------
# PRIVATE ROUTE TABLE - AZ1
# -------------------------

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-private-rt-1"
    Environment = var.environment
    Project     = "wordpress"
  }
}

resource "aws_route" "private_internet_1" {
  route_table_id         = aws_route_table.private_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_1.id
}


# -------------------------
# PRIVATE ROUTE TABLE - AZ2
# -------------------------

resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-private-rt-2"
    Environment = var.environment
    Project     = "wordpress"
  }
}

resource "aws_route" "private_internet_2" {
  route_table_id         = aws_route_table.private_2.id
  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = var.nat_gateway_count == 2 ? aws_nat_gateway.nat_2[0].id : aws_nat_gateway.nat_1.id
}


# -------------------------
# PUBLIC ASSOCIATIONS
# -------------------------

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}


# -------------------------
# PRIVATE ASSOCIATIONS
# -------------------------

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2.id
}