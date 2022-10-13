variable "ssh_pub_key" {
  description = "Public Key Pair to use for the instance."
  type        = string
  default     = ""
}

variable "hcloud_api_token" {
  description = "The Hetzner token"
  type        = string
  default     = ""
}

variable "hcloud_name" {
  description = "The name of the fluxbb instance."
  type        = string
  default     = "fluxbb"
}

variable "hcloud_image" {
  description = "The image for the instance."
  type        = string
  default     = "ubuntu-20.04"
}

variable "hcloud_server_type" {
  description = "The server type for the instance."
  type        = string
  default     = "cpx11"
}

variable "hcloud_location" {
  description = "The region for the instance."
  type        = string
  default     = "fsn1"
}

variable "user" {
  description = "Set the instance user name"
  type        = string
  default     = "root"
}

variable "private_key" {
  description = "Set the private key value for the instance from the hostmachine"
  type        = string
  default     = ""
}
