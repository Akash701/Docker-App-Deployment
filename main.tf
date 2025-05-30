provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "allow_ssh_http_custom" {
  name        = "allow_ssh_v3"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    description = "Custom App Port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "scp_server" {
ami = data.aws_ami.amazon_linux.id
instance_type = var.instence_type
key_name = var.key_pair
vpc_security_group_ids = [aws_security_group.allow_ssh_http_custom.id]


tags = {
  Name = "SCP-EC2"
}
provisioner "remote-exec" {
inline=[
    "sudo yum update -y",
    "sudo yum install docker -y",
    "sudo service docker start",
    "sudo usermod -aG docker ec2-user"

]

connection{
    type = "ssh"
    user = "ec2-user"
    private_key = file("${path.module}/ec2_key.pem")
    host = self.public_ip
}

}

}


output "ec2_public_ip" {
  value = aws_instance.scp_server.public_ip
}


