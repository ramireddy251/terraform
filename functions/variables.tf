variable "instances" {
    type = list
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
} 

variable "environment" {
  default = "prod"
}

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL 9 Image"
}

variable "dev_instance_type" {
  type    = string
  default = "t3a.micro"
}

variable "prod_instance_type" {
  type    = string
  default = "t3a.medium"
}


variable "sg_name" {
  type    = string
  default = "allow-all-roboshop"
}

variable "sg_description" {
  type    = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "sg_from_port" {
  type    = number
  default = 0
}

variable "sg_to_port" {
  type    = number
  default = 0
}

variable "sg_cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_protocal" {
  type    = string
  default = "-1"
}


variable "domain_name" {
    type = string
    default = "ramireddy.co.in"
  
}


variable "common_tags" {
  default = {
    project = "roboshop"
    Terraform = true
  }
}

variable "ec2_tags" {
  default = {
    Name = "functions-demo"
  }
}

variable "sg_tags" {
  default = {
    Name = "functions-demo"
  }
}