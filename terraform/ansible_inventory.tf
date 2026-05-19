# resource "local_file" "dev_ansible_inventory" {
#   filename = "../ansible/dev_inventory.ini"

#   content = templatefile("${path.module}/templates/inventory.tpl", {
#     ips         = module.dev_env.ec2_public_ips
#     private_key = "../keys/ec2_key"
#   })
# }

resource "local_file" "staging_ansible_inventory" {
  filename = "../ansible/staging_inventory.ini"

  content = templatefile("${path.module}/templates/inventory.tpl", {
    ips         = module.staging_env.ec2_public_ips
    private_key = "../keys/ec2_key"
  })
}

# resource "local_file" "prod_ansible_inventory" {
#   filename = "../ansible/prod_inventory.ini"

#   content = templatefile("${path.module}/templates/inventory.tpl", {
#     ips         = module.prod_env.ec2_public_ips
#     private_key = "../keys/ec2_key"
#   })
# }