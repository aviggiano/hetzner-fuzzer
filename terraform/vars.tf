variable "hcloud_token" {
  description = "Hetzener API token"
  sensitive   = true
}

variable "hcloud_ssh_key" {
  description = "SSH Key"
}

variable "namespace" {
  description = "Namespace"
}

variable "cmd" {
  description = "Command to run"
}
