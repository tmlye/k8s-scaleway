variable "region" {
  default     = "ams1"
  description = "Values: par1 ams1"
}

variable "server_type" {
  default     = "ARM64-2GB"
  description = "See the name column here: https://www.scaleway.com/virtual-cloud-servers/#anchor_starter"
}

variable "architecture" {
  default     = "arm64"
  description = "Values: arm64 x86_64"
}
