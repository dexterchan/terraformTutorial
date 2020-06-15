variable "region" {
    default = "us-east-1"
}
variable "testPubKey" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjVLK0R0ckYd4RI8WtXRYGa+uJou8ef3brDpH2Por/FNU5/2mFe0Ow3cTBec98UgOzdrKQTkyk16zAFYLIRf0MfPOHAm+9Wl5sYFaueTGdv86nHKFFijXG0fxcsESFeoZiFdwpUcqh+lsHkdBtZaEkBBiC/DhAKastd4nn3GtAuRLs9bmZ773MZbq6uioeZyJY8X5lPBrjn23hYIPZ4+n0oJvlsyTxhz06fwBB0bWYzHObkgAPra6mSDjmHkTwrebGWkK06qVPAkBiCH6m4IWHIKSD6bb8tEzYy1ruUJPCCinYwkxkIoEIKN2fdkELf9tslea+lJqAx65ojxAk4Dds/00CKywKM1i/6+MY/aidBn3tPVx9S4reUxoyw1vNYgcOYMsqsnfyK4wPNOX9lQe3yPvmroveyv7JXZwnDkhw4NSujxE5faBNJ2ezvQhOVLl4nS11lXrFKt3p815tubhoWxD21XPiGppKywy8mEt76Yop16i8NBDyj6eDhYR01bE= dexter"
}
variable "bastionsubnetid"{
    default = "subnet-011dbbc8b77486e1e"
}

variable "bastionsecurity_groups"{
    default = ["sg-0aa28abdfe9cfacd9"]
}



variable "privatewssubnet_2a_id"{
    default = "subnet-0305071ca8af5cf49"
}

variable "privatewssecurity_2a_groups"{
    default = ["sg-0e2b55d029f4ce8df"]
}

output "ip" {
  value = aws_eip.ip.public_ip
}
