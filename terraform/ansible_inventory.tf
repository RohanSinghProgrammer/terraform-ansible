resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"

  content = templatefile("${path.module}/inventory.tpl", {
    ips         = module.prod_env.ec2_public_ips
    private_key = "../keys/ec2_key"
  })
}