resource "hcloud_server" "this" {
  name        = "${var.namespace}-server"
  image       = "ubuntu-24.04"
  server_type = "cx52"
  location    = "hel1"

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  ssh_keys = [
    var.hcloud_ssh_key,
  ]
  user_data = templatefile("${path.module}/setup.tpl", {
    cmd = var.cmd
  })
}