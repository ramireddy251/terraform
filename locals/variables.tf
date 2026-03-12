variable "name" {
    type = string
    default = "locals"
}

variable "environment" {
    type = string
    default = "dev"
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
