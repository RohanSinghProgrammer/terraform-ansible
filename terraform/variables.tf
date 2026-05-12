variable "ec2_key" {
  description = "EC2 Key File Path"
  type        = string
  default     = "keys/ec2_key.pub"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-07a00cf47dbbc844c"
}

variable "ec2_region" {
  description = "EC2 Region"
  type = string
  default = "ap-south-1"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "Number of Instances"
  type        = number
  default     = 2
}

variable "ebs_size" {
  description = "Size of the EBS Volume"
  type        = number
  default     = 20
}

variable "ebs_type" {
  description = "Type of the EBS Volume"
  type        = string
  default     = "gp3"
}

variable "ebs_az" {
  description = "AZ of the EBS Volume"
  type        = string
  default     = "ap-south-1a"
}

variable "ec2_private_key_path" {
  description = "Private Key File Path"
  type        = string
  default     = "keys/ec2_key"
}
