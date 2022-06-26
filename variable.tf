variable "aws_region" {
default = "us-west-2"
}
variable "bucket_name" {}


variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t2.micro" 
}