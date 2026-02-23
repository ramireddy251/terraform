variable "environment" {
    default = "prod"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "RHEL 9 Image"
}

variable "dev_instance_type" {
    type = string
    default = "t3a.micro"
    }

variable "prod_instance_type" {
    type = string
    default = "t3a.medium"
    }    

variable "ec2_tags" {
    type = map
    default = {
      Name = "variables-demo"
      project = "roboshop"
      environemnt = "dev"
      Terraform = "true"
    }
}

variable "sg_name" {
    type = string
    default = "allow-all-terraform"
  }

variable "sg_description" {
    type = string
    default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "sg_from_port" {
    type = number
    default = 0
}

variable "sg_to_port" {
    type = number
    default = 0
}

variable "sg_cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_protocal" {
    type = string
    default = "-1"
  }

variable "sg_tags" {
    type = string
    default = "allow-all-terraform"
  
}
