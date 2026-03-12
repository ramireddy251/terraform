variable "project" {
    default = "roboshop"
}

variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    default = {
        dev = "t3.micro"
        prod = "t3.medium"
        uat = "t3.small"
    }
    
}