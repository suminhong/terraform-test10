provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "../module/vpc"

  vpc_cidr = var.vpc_cidr
  alltag   = var.alltag
}

module "public_subnet" {
  source = "../module/subnet"

  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
  public_subnet_az   = data.aws_availability_zones.available.names["${var.public_subnet_az}"]
  is_public          = true
  alltag             = var.alltag
  igw_id             = module.vpc.igw_id
}

module "private_subnet" {
  source = "../module/subnet"

  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = var.private_subnet_cidr
  public_subnet_az   = data.aws_availability_zones.available.names["${var.private_subnet_az}"]
  is_public          = false
  alltag             = var.alltag
  igw_id             = module.vpc.igw_id
}
