variable "env" {
  description = "Deployment environment"
  type        = string
}

variable "ec2_key" {
  description = "EC2 Key File Path"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "ec2_region" {
  description = "EC2 Region"
  type        = string
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "instance_count" {
  description = "Number of Instances"
  type        = number
}

variable "ebs_size" {
  description = "Size of the EBS Volume"
  type        = number
}

variable "ebs_type" {
  description = "Type of the EBS Volume"
  type        = string
}

variable "ebs_az" {
  description = "AZ of the EBS Volume"
  type        = string
}

variable "ec2_private_key_path" {
  description = "Private Key File Path"
  type        = string
}
