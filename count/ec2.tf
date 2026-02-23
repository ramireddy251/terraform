resource "aws_instance" "example" {
  count                  = 10
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? var.dev_instance_type : var.prod_instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
  Name        = var.instances[count.index]
  project     = "roboshop"
  environemnt = "dev"
  Terraform   = "true"
}
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port   = var.sg_from_port
    to_port     = var.sg_to_port
    protocol    = var.sg_protocal
    cidr_blocks = var.sg_cidr_blocks
  }

  egress {
    from_port   = var.sg_from_port
    to_port     = var.sg_to_port
    protocol    = var.sg_protocal
    cidr_blocks = var.sg_cidr_blocks
  }


  tags = {
    Name = var.sg_tags
  }
}

