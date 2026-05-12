output "ec2_public_ips" {
  value       = [for ip in aws_instance.ec2_instance[*].public_ip : ip]
  description = "Public IP Address of the EC2 Instance"
}

output "ec2_ssh_connect" {
  description = "Command to connect to EC2 using SSH"
  value       = [for ip in aws_instance.ec2_instance[*].public_ip : "ssh -i ${var.ec2_private_key_path} ubuntu@${ip}"]
}