variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
  
}

variable "sg_ids" {
    default = ["sg-0f8e049cbcce85622"]
}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "component" {
    default = "catalogue"
  
}