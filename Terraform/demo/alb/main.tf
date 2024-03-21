module "ssh_security_group" {
  source  = "../../terraform_modules/sg"
  name_sg = var.name_ssh_sg
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  tags    = var.default_tags

  ingress_rules = {
    "Rule for SSH " = {
      from_port    = 22
      to_port      = 22
      protocol     = "tcp"
      cidr = ["0.0.0.0/0"]
    }
  }
}


module "alb_security_group" {
  source  = "../../terraform_modules/sg"
  name_sg = var.name_alb_sg
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  tags    = var.default_tags

  ingress_rules = {
   
    "Rule for 80 port from Public Internet" = {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr      = ["0.0.0.0/0"]
    }
  }
}

module "pvt_alb_security_group" {
  source  = "../../terraform_modules/sg"
  name_sg = var.name_pvt_alb_sg
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  tags    = var.default_tags

  ingress_rules = {
    "Rule for 80 port " = {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr = ["0.0.0.0/0"]
    }
  }
}
    


module "back_end_security_group" {
  source  = "../../terraform_modules/sg"
  name_sg = var.name_back_end_app_sg
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  tags    = var.default_tags

  ingress_rules = {
   
    "Rule for 80 port from ALB SG" = {
      from_port    = 80
      to_port      = 80
      protocol     = "tcp"
      cidr = ["0.0.0.0/0"]
    }
  }
}

module "db_security_group" {
  source  = "../../terraform_modules/sg"
  name_sg = var.name_db_sg
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  tags    = var.default_tags

  ingress_rules = {
    "Rule for 3306 port " = {
      from_port    = 3306
      to_port      = 3306
      protocol     = "tcp"
      cidr = ["0.0.0.0/0"]
    }
    
  }
}



module "pub_alb" {
  source                     = "../../terraform_modules/alb"
  alb_name                   = var.alb_name
  internal                   = var.alb_type
  security_groups_id         = [module.alb_security_group.sg_id]
  subnets_id                 = [data.terraform_remote_state.network.outputs.pub_subnet_ids[0], data.terraform_remote_state.network.outputs.pub_subnet_ids[1]]
  tags                       = var.tags
  enable_deletion_protection = var.enable_deletion_protection
}

module "pvt_alb" {
  source                     = "../../terraform_modules/alb"
  alb_name                   = var.pvt_alb_name
  internal                   = var.pvt_alb_type
  security_groups_id         = [module.pvt_alb_security_group.sg_id]
  subnets_id                 = [data.terraform_remote_state.network.outputs.app_subnet_ids[0], data.terraform_remote_state.network.outputs.app_subnet_ids[1]]
  tags                       = var.tags
  enable_deletion_protection = var.enable_deletion_protection
}