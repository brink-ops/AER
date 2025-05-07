
module "vpc" {
  source = "../modules/vpc"

  region        = var.region
  project       = var.project
  }
module "sec-groups" {
  source = "../modules/sec-groups"
  my_vpc = module.vpc.my_vpc
  project = var.project
}

# Create the Load Balancer
module "load-balancer" {
  source  = "../modules/load-balancer"
  project = var.project
  my_vpc = module.vpc.my_vpc
  subnet_az1 = module.vpc.subnet_az1
  subnet_az2 = module.vpc.subnet_az2
  allow_http = module.sec-groups.allow_http
}

# Create the Autoscaling Group
module "autoscaling-group" {
  source = "../modules/autoscaling-group"

  project        = var.project
  my_vpc         = module.vpc.my_vpc
  startup_script = "install_space_invaders.sh"
  
  my_lb             = module.load-balancer.my_lb

  instance_type      = "t2.micro"
  instance_count_min = 2
  instance_count_max = 4
  add_public_ip      = true

  subnet_az1 = module.vpc.subnet_az1
  subnet_az2 = module.vpc.subnet_az2
 
  allow_http = module.sec-groups.allow_http

}

