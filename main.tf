

# -------------------------------
provider "aws" {
  region = "us-east-1"
}


module "s3" {
  source                      = "./modules/ec2/"
  ssh_public_key_contents     = var.ssh_public_key_contents
}
