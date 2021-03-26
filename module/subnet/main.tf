resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_subnet_az
  map_public_ip_on_launch = var.is_public

  tags = {
    Name = "${var.alltag}-subnet-${var.public_or_private[var.is_public]}"
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.alltag}-rtb-${var.public_or_private[var.is_public]}"
  }
}

resource "aws_route" "rtb" {
  count                  = var.is_public ? 1 : 0
  route_table_id         = aws_route_table.rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "rtb" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rtb.id
}
