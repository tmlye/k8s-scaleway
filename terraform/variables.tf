variable "region" {
  default     = "ams1"
  description = "Values: par1 ams1"
}

variable "server_type" {
  default     = "START1-S"
  description = "Check the name column in the web console for possible values"
}

variable "architecture" {
  default     = "x86_64"
  description = "Values: arm64 x86_64"
}
