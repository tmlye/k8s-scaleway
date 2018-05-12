provider "scaleway" {
  region = "${var.region}"
}

data "scaleway_image" "ubuntu" {
  architecture = "${var.architecture}"
  name         = "Ubuntu Xenial"
}

resource "scaleway_ip" "master_ip" {}

resource "scaleway_server" "master" {
  name      = "${terraform.workspace}-master"
  image     = "${data.scaleway_image.ubuntu.id}"
  type      = "${var.server_type}"
  public_ip = "${scaleway_ip.master_ip.ip}"
}
