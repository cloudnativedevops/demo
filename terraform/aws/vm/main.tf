provider "aws" {}

resource "aws_instance" "vm" {
  ami           = "ami-b6e499ce"
  instance_type = "t2.micro"

  tags {
    App         = "${var.name}"
    environment = "${var.environment}"
    Name        = "${var.environment}-${var.name}"
  }
}
