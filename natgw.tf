resource "aws_eip" "nat_1" {
  domain = "vpc"

  tags = {
    Name        = "${var.environment}-nat-eip-1"
    Environment = var.environment
    Project     = "wordpress"
  }
}

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.nat_1.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name        = "${var.environment}-nat-gateway-1"
    Environment = var.environment
    Project     = "wordpress"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "nat_2" {
  count  = var.nat_gateway_count == 2 ? 1 : 0
  domain = "vpc"

  tags = {
    Name        = "${var.environment}-nat-eip-2"
    Environment = var.environment
    Project     = "wordpress"
  }
}

resource "aws_nat_gateway" "nat_2" {
  count = var.nat_gateway_count == 2 ? 1 : 0

  allocation_id = aws_eip.nat_2[0].id
  subnet_id     = aws_subnet.public_2.id

  tags = {
    Name        = "${var.environment}-nat-gateway-2"
    Environment = var.environment
    Project     = "wordpress"
  }

  depends_on = [aws_internet_gateway.main]
}