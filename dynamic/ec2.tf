resource "aws_instance" "example" {
  #for_each = var.instances
  for_each = toset(var.instances)
  ami                    = var.ami_id
  #instance_type          = each.value
  instance_type = var.dev_instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
  Name        = each.key
  project     = "roboshop"
  environemnt = "dev"
  Terraform   = "true"
}
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
    from_port   = ingress.value.port
    to_port     = ingress.value.port
    protocol    = var.ingress_protocal
    cidr_blocks = ingress.value.cidr_blocks
    description = ingress.value.description
  }
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

