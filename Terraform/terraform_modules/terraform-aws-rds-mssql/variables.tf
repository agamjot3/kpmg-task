variable "engine_name" {
  description = "name of db engine"
  type        = string
  default     = "sqlserver-ex"
}

variable "engine_version" {
  description = "version of db engine"
  type        = string
  default     = ""
}

variable "identifier" {
  description = "name of db identifier"
  type        = string
  default     = "mssql-server"
}

variable "db_name" {
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
  default     = null
}

variable "parameter_group" {
  description = "Enter the name of the parameter group to be created "
  type        = string
  default     = "default.mysql8.0"
}

variable "apply_immediately" {
  description = "Apply PG immediately (yes or no)"
  type        = bool
  default     = true
}

variable "username" {
  description = "username"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Enter the password"
  type        = string
  default     = "12345"
}

variable "delete_automated_backups" {
  description = "delete automated backup (yes or no)"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "skip backup"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "if multi az"
  type        = bool
  default     = true
}

variable "public_access" {
  description = "Publically accessible"
  type        = bool
  default     = false
}

variable "instance_class" {
  description = "type of instance"
  type        = string
  default     = "db.t3.small"
}

variable "allocated_storage" {
  description = "storage size"
  type        = number
  default     = 20
}

variable "subnet_group_name" {
  description = "subnet group name"
  type        = string
  default     = "db_sn_1"
}

variable "database_subnet_ids" {
  description = "ids of database subnets"
  type        = list(string)
  default     = null
}

variable "database_security_groups" {
  description = "security group of database"
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "kms_key_id" {
  description = "kms_key_id database "
  type        = string
  default     = null
}

variable "storage_encrypted" {
  description = "Storage encryption"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  type    = number
  default = 7
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = false
}

variable "create_replica" {
  description = "create_replica of database "
  type        = string
  default     = true
}

variable "create_second_replica" {
  description = "create_replica of database "
  type        = string
  default     = true
}

variable "deletion_protection" {
  description = "deletion protection on or off "
  type        = bool
  default     = true
}

variable "performance_insights_enabled" {
  description = "performance insights on or off "
  type        = bool
  default     = false
}

variable "monitoring_interval" {
  description = "Monitoring Interval "
  type        = number
  default     = 0
}

variable "identifier_replica" {
  description = "identifier_replica of database "
  type        = string
  default     = null
}

variable "instance_class_replica" {
  description = "instance_class_replica of database "
  type        = string
  default     = null
}

variable "identifier_replica2" {
  description = "identifier_replica of database "
  type        = string
  default     = null
}

variable "instance_class_replica2" {
  description = "instance_class_replica of database "
  type        = string
  default     = null
}

variable "replica_availablity_zone" {
  description = "Availablity zone of replica"
  type        = string
  default     = null
}

variable "replica2_availablity_zone" {
  description = "Availablity zone of replica"
  type        = string
  default     = null
}

variable "master_availablity_zone" {
  description = "Availablity zone of replica"
  type        = string
  default     = null
}

variable "storage_type" {
  description = "Type of Storage"
  type        = string
  default     = null
}