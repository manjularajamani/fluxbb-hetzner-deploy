# fluxbb-hetzner-deploy

This deploy the FluxBB application on Hetzner instance using the Terraform(Infrastructure) and Ansible(Configuration)

# How to run application
Clone the repo

```
git clone https://github.com/manjularajamani/fluxbb-hetzner-deploy.git
```
# Submodule update

Put the below command after cloning the repository for update the git submodule to get the content from submodule repositoy

```
cd fluxbb-hetzner-deploy
git submodule update --init
```

# Create the playbook for task running

Create the `main.yml` ansible playbook for access the ansible-roles to application running.
```
#main.yml

- hosts: all
  become: true
  roles:
    - <path_to_ansible-role-fluxbb>
```

# Provide a path of playbook

Enter into the terraform-hetzner-fluxbb directory

```
cd terraform-hetzner-fluxbb
```
Edit the `main.tf` template to add the path of ansible playbook.yml
```
provisioner "local-exec" {
    command = <<EOT
      sleep 120 && \
      > hosts && \
      echo "[fluxbb]" | tee -a hosts && \
      echo "${hcloud_server.fluxbb.ipv4_address} ansible_user=${var.user} ansible_ssh_private_key_file=${var.private_key}" | tee -a hosts && \
      ansible-playbook -u ${var.user} -i hosts <path_to_playbook's_main.yml>
    EOT
  }
} 
```
# Run the Terraform template

```
terraform init
terraform plan 
terraform apply
```
# Contributing
Don’t hesitate to create a pull request