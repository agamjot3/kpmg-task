variable "engine_name" {
  description = "name of db engine"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "version of db engine"
  type        = string
  default     = ""
}

variable "identifier" {
  description = "name of db identifier"
  type        = string
  default     = "kpmg-demo-mssql"
}

variable "db_name" {
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
  default     = null
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
  default     = false
}

variable "public_access" {
  description = "Publically accessible"
  type        = bool
  default     = false
}

variable "instance_class" {
  description = "type of instance"
  type        = string
  default     = "db.t3x.large"
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
  description = "Publically accessible"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  type    = number
  default = 7
}

variable "auto_minor_version_upgrade" {
  type    = bool
  default = true
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
  description = "identifier_replica2 of database "
  type        = string
  default     = null
}

variable "instance_class_replica2" {
  description = "instance_class_replica2 of database "
  type        = string
  default     = null
}

variable "region" {
  type    = string
  default = ""
}

variable "default_tags" {
  type = map(string)
  default = {
    "Owner"       = "Agamjot Singh"
    "Environment" = "demo"
  }
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

variable "pg_name" {
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
  default     = null
}

variable "monitoring_interval" {
  description = "Monitoring Interval for RDS"
  type        = string
  default     = 60
}