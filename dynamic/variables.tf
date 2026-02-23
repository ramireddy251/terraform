# variable "instances" {
#   type = map
#  default = {
#    mongodb = "t3a.micro"
#    redis = "t3a.small"
#    shipping = "t3a.micro"

# }    
# }

# This should be converted in to set
variable "instances" {
  type = list
  default = ["mongo", "redis"]
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

variable "ingress_rules" {
  default = [
    {
       port = 22
       cidr_blocks = ["0.0.0.0/0"]
       description = "Allowing port number 22 from internet"
    },
    {
      port = 443
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port number 443 from internet"
    },
    {
      port = 3306
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allowing port number 3306 from internet"
    }
  ]
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

variable "ingress_protocal" {
  type = string
  default = "tcp"
  
}
variable "sg_protocal" {
  type    = string
  default = "-1"
}

variable "sg_tags" {
  type    = string
  default = "allow-all-terraform"

}

variable "domain_name" {
    type = string
    default = "ramireddy.co.in"
  
}

variable "fruits" {
   type = list(string)
   default = ["apple", "banana", "apple", "orange"] 
}

variable "fruits_set" {
   type = set(string)
   default = ["apple", "banana", "apple", "orange"] 
}