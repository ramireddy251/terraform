resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  provisioner "local-exec" {
    command = "echo '${self.public_ip}' > inventory.ini"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo 'deleting the instance'"
  }

  provisioner "local-exec" {
    command = "exit 1"
    on_failure = continue
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo > inventory.ini"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx"
    ]
    when = destroy
  }

  tags = local.ec2_final_tags
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-all-terraform"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "allow-all-terraform"
  }
}