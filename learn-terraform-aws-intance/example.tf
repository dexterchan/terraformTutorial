provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "test"
  public_key = file("~/.ssh/aws_humble_pig.pub")
}

resource "aws_instance" "bastion" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = "ami-09c819878a285510b"
  instance_type = "t2.micro"
  subnet_id     = "subnet-011dbbc8b77486e1e"
  security_groups = ["sg-0aa28abdfe9cfacd9"]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/aws_humble_pig")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx"
    ]
  }
}
resource "aws_instance" "privatews1" {
  key_name      = "aws_humblepig2020"
  ami           = "ami-0e1273b46a7b85916"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0305071ca8af5cf49"
  security_groups = ["sg-0e2b55d029f4ce8df"]
}
resource "aws_instance" "privatews2" {
  key_name      = "aws_humblepig2020"
  ami           = "ami-0e1273b46a7b85916"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0305071ca8af5cf49"
  security_groups = ["sg-0e2b55d029f4ce8df"]
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.bastion.id
}





