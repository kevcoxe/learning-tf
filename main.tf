

# -------------------------------
provider "aws" {
  region = "us-east-1"
}


module "ec2" {
  source                      = "./modules/ec2/"
  ssh_public_key_contents     = var.ssh_public_key_contents
  webserver_nic_id            = module.vpc.webserver_nic_id
}

module "vpc" {
  source                      = "./modules/vpc/"
}

output "ec2_instance_public_ip" {
  value = module.vpc.server_public_ip
}