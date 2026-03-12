module "ec2" {
    source = "../terraform-aws-instance"
    project = var.project
    environment = var.environment
    ami_id = var.ami_id
    sg_ids = var.sg_ids
    instance_type = var.instance_type
    tags = {
        Name = "${var.project}-${var.environment}-${var.component}"
        component = var.component
    }
    
}