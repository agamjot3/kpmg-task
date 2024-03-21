resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s-rt", var.name)
    },
    var.tags,
  )
}

resource "aws_route" "route" {
  for_each                  = var.routes
  route_table_id            = aws_route_table.route_table.id
  destination_cidr_block    = each.key
  nat_gateway_id            = can(regex("^nat-", each.value)) ? each.value : null
  gateway_id                = can(regex("^igw-", each.value)) || can(regex("^vgw-", each.value)) ? each.value : null
  vpc_peering_connection_id = can(regex("^pcx-", each.value)) ? each.value : null
  transit_gateway_id        = can(regex("^tgw-", each.value)) ? each.value : null
  vpc_endpoint_id           = can(regex("^vpce-", each.value)) ? each.value : null
  egress_only_gateway_id    = can(regex("^eigw-", each.value)) ? each.value : null
  network_interface_id      = can(regex("^eni-", each.value)) ? each.value : null
}
