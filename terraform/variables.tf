variable "region" {
  default     = "par1"
  description = "Values: par1 ams1"
}

variable "server_type" {
  default     = "C1"
  description = "See: https://www.scaleway.com/virtual-cloud-servers/#anchor_starter"
}

variable "architecture" {
  default     = "arm"
  description = "Values: arm arm64 x86_64"
}
