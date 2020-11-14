


# ------------------------------------------------------------
# ssh key
resource "aws_key_pair" "generated_key" {
  key_name   = "ssh_key"
  public_key = var.ssh_public_key_contents
}


# ------------------------------------------------------------
# ec2 instance info
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web-server-instance" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = aws_key_pair.generated_key.key_name

  network_interface {
    device_index         = 0
    network_interface_id = var.webserver_nic_id
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install git python3-pip -y
    cd /home/ubuntu
    sudo git clone https://github.com/kevcoxe/ip-tracker.git
    cd ip-tracker
    pip3 install -r requirements.txt
    sudo python3 app.py &
  EOF

  tags = {
    Name = "web-server"
  }
}