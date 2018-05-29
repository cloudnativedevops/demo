resource "aws_instance" "vm1" {
  ami           = "ami-efd0428f"
  instance_type = "t2.micro"
  key_name      = "${var.key_name}"

  tags {
    Name = "demo"
  }
}
