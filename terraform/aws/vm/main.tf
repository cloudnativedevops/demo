provider "aws" {}

resource "aws_instance" "vm" {
  ami           = "ami-b6e499ce"
  instance_type = "t2.micro"

  tags {
    App   = "${var.name}"
    Phase = "${var.phase}"
    Name  = "${var.phase}-${var.name}"
  }
}
