resource "aws_eip" "nat_ip" {
  count  = var.enable_az_specific == true ? length(var.subnets_id) : 1
  domain = "vpc"
  tags = merge(
    {
      Name = format("%s-nat-eip", var.name)
    },
    var.eip_tags
  )
}

resource "aws_nat_gateway" "nat-gw" {
  count         = var.enable_az_specific == true ? length(var.subnets_id) : 1
  allocation_id = aws_eip.nat_ip.*.id[count.index]
  subnet_id     = var.subnets_id[count.index]
  tags = merge(
    {
      Name = format("%s-nat", var.name)
    },
    var.nat_tags,
  )
}
