terraform {
  required_version = ">= 0.12.0"
}

provider "scaleway" {
  version = "~>1.10"
  region  = "${var.region}"
}

data "scaleway_image" "ubuntu" {
  architecture = "${var.architecture}"
  name         = "Ubuntu Bionic"
}
