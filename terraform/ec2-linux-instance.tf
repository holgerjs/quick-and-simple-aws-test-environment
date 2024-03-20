resource "aws_network_interface" "ubuntu-nic" {
  subnet_id = aws_subnet.main_private_subnet.id

  security_groups = [
    aws_security_group.allow_tls_inside_vpc.id
  ]

  tags = {
    Name  = "ubuntu-primary-nic"
    environment = "sandbox"
    owner = "test"
  }
}

resource "aws_instance" "ubuntu_linux" {
  ami                  = "ami-039e31dd8219f99f7"
  instance_type        = "t2.micro"
  iam_instance_profile = "CustomSessionManagerRole"

  network_interface {
    network_interface_id = aws_network_interface.ubuntu-nic.id
    device_index         = 0

  }

  tags = {
    Name  = "test-ubn-01"
    OS    = "Ubuntu20.04LTS"
    environment = "sandbox"
    owner = "test"
  }
}
