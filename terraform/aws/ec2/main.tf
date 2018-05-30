provider "aws" {}

resource "aws_instance" "vm1" {
  ami           = "ami-b6e499ce"
  instance_type = "t2.micro"
}
