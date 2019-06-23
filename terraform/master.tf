resource "scaleway_ip" "master_ip" {}

resource "scaleway_server" "master" {
  name      = "${terraform.workspace}-master"
  image     = data.scaleway_image.ubuntu.id
  type      = var.server_type
  public_ip = scaleway_ip.master_ip.ip

  connection {
    host  = scaleway_ip.master_ip.ip
    type  = "ssh"
    user  = "root"
    agent = true
  }

  provisioner "file" {
    source      = "../chef"
    destination = "/tmp"
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh master.json"
    ]
  }
}

resource "scaleway_security_group" "kubernetes_master" {
  name                    = "kubernetes_master"
  description             = "Opens all connections for a Kubernetes master"
  enable_default_security = true
  inbound_default_policy  = "drop"
  outbound_default_policy = "drop"
}

resource "scaleway_security_group_rule" "accept_api_server" {
  security_group = scaleway_security_group.kubernetes_master.id

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 6443
}

resource "scaleway_security_group_rule" "accept_etcd" {
  security_group = scaleway_security_group.kubernetes_master.id

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"

  count = 2
  port  = 2379 + count.index # 2379-2380
}

resource "scaleway_security_group_rule" "accept_api_scheduler_manager" {
  security_group = scaleway_security_group.kubernetes_master.id

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"

  count = 3
  port = count.index + 10250 # 10250-10252
}
