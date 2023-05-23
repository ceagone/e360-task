#Key-Pairs for SSH
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "tf-key" {
  content         = tls_private_key.key.private_key_pem
  filename        = var.key_name
  file_permission = 0600
}



#Security Group to open port 22
resource "aws_security_group" "open_ssh" {
  name        = "Open_SSH"
  description = "Allowed SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_traffic"
  }
}



#Datasource to query Amazon-Linux2 AMI for any region
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}



#EC2 Instance Block
resource "aws_instance" "e360-web" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.open_ssh.id]


  tags = {
    Name = "e360-web"
  }
}