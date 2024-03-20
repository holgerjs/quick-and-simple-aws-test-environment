resource "aws_network_interface" "win2022-nic" {
  subnet_id = aws_subnet.main_private_subnet.id

  security_groups = [
    aws_security_group.allow_tls_inside_vpc.id
  ]

  tags = {
    Name  = "win2022-primary-nic"
    environment = "sandbox"
    owner = "test"
  }
}

resource "aws_instance" "windows-2022" {
  ami                  = "ami-0e9ea35223a924666"
  instance_type        = "t2.medium"
  iam_instance_profile = "CustomSessionManagerRole"

  network_interface {
    network_interface_id = aws_network_interface.win2022-nic.id
    device_index         = 0

  }

  tags = {
    Name  = "test-win-01"
    OS    = "WindowsServer2022"
    environment = "sandbox"
    owner = "test"
  }
}
