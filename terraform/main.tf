module "dev_env" {
  source = "./modules"
  env = "dev"
  ec2_key = "keys/ec2_key.pub"
  ami_id = "ami-07a00cf47dbbc844c"
  ec2_region = "ap-south-1"
  instance_type = "t3.micro"
  instance_count = 1
  ebs_size = 16
  ebs_type = "gp3"
  ebs_az = "ap-south-1a"
  ec2_private_key_path = "../keys/ec2_key"
}

module "staging_env" {
  source = "./modules"
  env = "staging"
  ec2_key = "keys/ec2_key.pub"
  ami_id = "ami-07a00cf47dbbc844c"
  ec2_region = "ap-south-1"
  instance_type = "t3.micro"
  instance_count = 2
  ebs_size = 20
  ebs_type = "gp3"
  ebs_az = "ap-south-1a"
  ec2_private_key_path = "../keys/ec2_key"
}

module "prod_env" {
  source = "./modules"
  env = "prod"
  ec2_key = "keys/ec2_key.pub"
  ami_id = "ami-07a00cf47dbbc844c"
  ec2_region = "ap-south-1"
  instance_type = "t3.medium"
  instance_count = 2
  ebs_size = 24
  ebs_type = "gp3"
  ebs_az = "ap-south-1a"
  ec2_private_key_path = "../keys/ec2_key"
}