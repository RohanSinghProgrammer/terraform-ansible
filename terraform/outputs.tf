output "dev_public_ips" {
  value = module.dev_env.ec2_public_ips
}

output "staging_public_ips" {
  value = module.staging_env.ec2_public_ips
}

output "prod_public_ips" {
  value = module.prod_env.ec2_public_ips
}

output "dev_ssh_commands" {
  value = module.dev_env.ec2_ssh_connect
}

output "staging_ssh_commands" {
  value = module.staging_env.ec2_ssh_connect
}

output "prod_ssh_commands" {
  value = module.prod_env.ec2_ssh_connect
}