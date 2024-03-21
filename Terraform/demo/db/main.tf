data "aws_secretsmanager_secret" "demo_kpmg_secrets" {
  name = "demo_kpmg_secrets"
}

data "aws_secretsmanager_secret_version" "demo_kpmg_rds_credentials" {
  secret_id = data.aws_secretsmanager_secret.demo_kpmg_secrets.id
}



module "demo-db-instance" {
  source                    = "../../terraform_modules/terraform-aws-rds-mssql"
  create_replica            = true
  create_second_replica     = false
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  performance_insights_enabled = false
  database_security_groups  = [data.terraform_remote_state.resources.outputs.db_security_group_id]
  database_subnet_ids       = [data.terraform_remote_state.network.outputs.db_subnet_ids[0], data.terraform_remote_state.network.outputs.db_subnet_ids[1]]
  engine_name               = var.engine_name
  engine_version            = var.engine_version
  identifier                = var.identifier
  identifier_replica        = var.identifier_replica
  identifier_replica2       = var.identifier_replica2
  username                  = jsondecode(data.aws_secretsmanager_secret_version.demo_kpmg_rds_credentials.secret_string)["kpmg-demo-mysql-username"]
  password                  = jsondecode(data.aws_secretsmanager_secret_version.demo_kpmg_rds_credentials.secret_string)["kpmg-demo-mysql-password"]
  multi_az                  = var.multi_az
  apply_immediately         = true
  kms_key_id                = var.kms_key_id
  public_access             = var.public_access
  instance_class            = var.instance_class
  instance_class_replica    = var.instance_class_replica
  instance_class_replica2   = var.instance_class_replica2
  allocated_storage         = var.allocated_storage
  storage_type              = var.storage_type
  deletion_protection       = true
  master_availablity_zone   = var.master_availablity_zone
  replica_availablity_zone  = var.replica_availablity_zone
  replica2_availablity_zone = var.replica2_availablity_zone
  subnet_group_name         = var.subnet_group_name
  tags                      = var.tags
}