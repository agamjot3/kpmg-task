resource "aws_db_subnet_group" "db_sub_group" {
  name       = var.subnet_group_name
  subnet_ids = var.database_subnet_ids
  tags       = var.tags
}
