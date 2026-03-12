locals {
  instance_name = "${var.name}-${var.environment}"
  instance_type = "t3.micro"
  commom_tags = {
    project = "roboshop"
    Terraform = true
  }
  ec2_final_tags = merge(local.commom_tags, var.ec2_tags)
  ami_id = "ami-0220d79f3f480ecf5"
}

