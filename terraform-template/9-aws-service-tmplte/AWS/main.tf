provider "aws" {
  region = "${var.aws_region}"
}

# Deploy Storage Resources
module "storage" {
  source       = "./storage"
  project_name = "${var.project_name}"
}

# Deploy Networking Resources
module "networking" {
  source       = "./networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  accessip     = "${var.accessip}"
}

# Deploy compute resource
module "compute" {
  source = "./compute"
  instance_count = "${var.instance_count}"
  key_name = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type = "${var.server_instance_type}"
  subnets = "${module.networking.public_subnets}"   # These are output from module networking
  security_group = "${module.networking.public_sg}" # These are output from module networking
  subnet_ips = "${module.networking.subnet_ips}"    # These are output from module networking
  
}
