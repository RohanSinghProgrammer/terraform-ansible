[servers]
%{ for idx, ip in ips ~}
worker-node-${idx + 1} ansible_host=${ip} ansible_user=ubuntu
%{ endfor ~}

[all:vars]
ansible_ssh_private_key_file=${private_key}
ansible_python_interpreter=/usr/bin/python3