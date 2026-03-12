variable "project" {
    type = string
}

variable "environment" {
    type = string
}

variable "ami_id" {
    type = string 
    #default = "ami-0220d79f3f480ecf5"  
  }

variable "instance_type" {
    type = string
  }

variable "sg_ids" {
    type = list(string)
}  

variable "tags" {
    type = map
    default = {}
}