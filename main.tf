

# -------------------------------
provider "aws" {
  region = "us-east-1"
}


module "ec2" {
  source                      = "./modules/ec2/"
  ssh_public_key_contents     = var.ssh_public_key_contents
}

output "ec2_instance_public_ip" {
  value = module.ec2.server_public_ip
}