resource "aws_db_instance" "default" {
  engine                     = var.engine_name
  engine_version             = var.engine_version
  db_name                    = var.db_name
  availability_zone          = var.master_availablity_zone
  identifier                 = var.identifier
  username                   = var.username
  password                   = var.password
  db_subnet_group_name       = aws_db_subnet_group.db_sub_group.id
  skip_final_snapshot        = var.skip_final_snapshot
  delete_automated_backups   = var.delete_automated_backups
  multi_az                   = var.multi_az
  kms_key_id                 = var.kms_key_id
  publicly_accessible        = var.public_access
  vpc_security_group_ids     = var.database_security_groups
  instance_class             = var.instance_class
  allocated_storage          = var.allocated_storage
  storage_encrypted          = var.storage_encrypted
  backup_retention_period    = var.backup_retention_period
  performance_insights_enabled = var.performance_insights_enabled
  monitoring_interval        = var.monitoring_interval
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  storage_type               = var.storage_type
  deletion_protection        = var.deletion_protection
  parameter_group_name       = var.parameter_group
  apply_immediately          = var.apply_immediately
  tags                       = var.tags
}

resource "aws_db_instance" "replica" {
  count = var.create_replica ? 1 : 0
  replicate_source_db        = aws_db_instance.default.identifier
  identifier                 = var.identifier_replica
  password                   = var.password
  instance_class             = var.instance_class_replica
  engine                     = var.engine_name
  engine_version             = var.engine_version
  db_name                    = var.db_name
  availability_zone          = var.replica_availablity_zone
  skip_final_snapshot        = var.skip_final_snapshot
  delete_automated_backups   = var.delete_automated_backups
  multi_az                   = false
  kms_key_id                 = var.kms_key_id
  publicly_accessible        = var.public_access
  vpc_security_group_ids     = var.database_security_groups
  storage_encrypted          = var.storage_encrypted
  backup_retention_period    = var.backup_retention_period
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  deletion_protection        = var.deletion_protection
}

resource "aws_db_instance" "replica2" {
  count = var.create_second_replica ? 1 : 0
  replicate_source_db        = aws_db_instance.default.identifier
  identifier                 = var.identifier_replica2
  password                   = var.password
  instance_class             = var.instance_class_replica2
  engine                     = var.engine_name
  engine_version             = var.engine_version
  db_name                    = var.db_name
  availability_zone          = var.replica2_availablity_zone
  skip_final_snapshot        = var.skip_final_snapshot
  delete_automated_backups   = var.delete_automated_backups
  multi_az                   = false
  kms_key_id                 = var.kms_key_id
  publicly_accessible        = var.public_access
  vpc_security_group_ids     = var.database_security_groups
  storage_encrypted          = var.storage_encrypted
  backup_retention_period    = var.backup_retention_period
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  deletion_protection        = var.deletion_protection
}