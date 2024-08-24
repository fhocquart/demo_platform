provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"

tags = {
    Name = "demo_vpc"
  }
}

data "aws_key_pair" "femi_keypair" {
  key_name = "femi_keypair"
}

resource "aws_instance" "demo_instance" {
  ami           = "ami-0e86e20dae9224db8" # Public Ubuntu AMI ID
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.femi_keypair.key_name

  tags = {
    Name = "Demo_Instance"
  }
}

output "femi_keypair_fingerprint" {
  value = data.aws_key_pair.femi_keypair.key_pair_id
}
