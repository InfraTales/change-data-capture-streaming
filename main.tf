# ============================================================================
# Main Infrastructure Configuration
# ============================================================================

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
  azs          = var.azs
}

# Compute Module
module "compute" {
  source = "./modules/compute"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  instance_type      = var.instance_type
}

# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  alert_email  = var.alert_email
}
