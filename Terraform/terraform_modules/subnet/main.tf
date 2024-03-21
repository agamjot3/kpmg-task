resource "aws_subnet" "subnet" {
  count                   = length(var.subnets_cidr)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.subnets_cidr, count.index)
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = merge(
    {
      Name = format("%s-subnet-${element(split("-", var.availability_zones[count.index]), 2)}", var.subnet_name)
    },
    var.tags,
  )
}
resource "aws_route_table_association" "route_table_association" {
  count          = length(aws_subnet.subnet.*.id)
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = var.route_table_id != null ? var.route_table_id : var.route_table_ids[count.index]
}

