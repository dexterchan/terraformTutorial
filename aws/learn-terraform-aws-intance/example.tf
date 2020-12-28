terraform {
  backend "remote" {
    organization = "dextest"

    workspaces {
      name = "test"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_humble_pig"
  public_key = var.testPubKey
}

resource "aws_instance" "bastion" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = "ami-09c819878a285510b"
  instance_type = "t2.micro"
  subnet_id     = var.bastionsubnetid
  security_groups = var.bastionsecurity_groups
}
resource "aws_instance" "privatews1" {
  key_name      = "aws_humblepig2020"
  ami           = "ami-0e1273b46a7b85916"
  instance_type = "t2.micro"
  subnet_id     = var.privatewssubnet_2a_id
  security_groups = var.privatewssecurity_2a_groups
}
resource "aws_instance" "privatews2" {
  key_name      = "aws_humblepig2020"
  ami           = "ami-0e1273b46a7b85916"
  instance_type = "t2.micro"
  subnet_id     = var.privatewssubnet_2a_id
  security_groups = var.privatewssecurity_2a_groups
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.bastion.id
}





