output "master_public_ip" {
  value = "${scaleway_ip.master_ip.0.ip}"
}
