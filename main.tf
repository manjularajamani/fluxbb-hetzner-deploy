terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.30"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_api_token
}

resource "hcloud_ssh_key" "keypair" {
  name       = "Public Key"
  public_key = var.ssh_pub_key
}

resource "hcloud_firewall" "fluxbbfirewall" {
  name = "fluxbb-firewall"
  rule {
    direction = "in"
    port      = "22-8080"
    protocol  = "tcp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_floating_ip" "master" {
  type      = "ipv4"
  server_id = hcloud_server.fluxbb.id
}

resource "hcloud_volume" "master" {
  name      = "volume1"
  size      = 50
  server_id = hcloud_server.fluxbb.id
  automount = true
  format    = "ext4"
}

resource "hcloud_server" "fluxbb" {
  name         = var.hcloud_name
  image        = var.hcloud_image
  server_type  = var.hcloud_server_type
  location     = var.hcloud_location
  ssh_keys     = [hcloud_ssh_key.keypair.id]
  firewall_ids = [hcloud_firewall.fluxbbfirewall.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  connection          {
    agent            = false
    type             = "ssh"
    host             = hcloud_server.fluxbb.ipv4_address
    private_key      = "${file(var.private_key)}"
    user             = "${var.user}"
  }

  provisioner "remote-exec" {
      inline = [
        "sudo apt-get update -y",
        "sudo apt-get install python3.9 -y",
        ]
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 120 && \
      > hosts && \
      echo "[fluxbb]" | tee -a hosts && \
      echo "${hcloud_server.fluxbb.ipv4_address} ansible_user=${var.user} ansible_ssh_private_key_file=${var.private_key}" | tee -a hosts && \
      ansible-playbook -u ${var.user} -i hosts main.yaml
    EOT
  }
}  