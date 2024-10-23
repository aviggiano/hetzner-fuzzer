data "template_file" "this" {
  template = file("../setup.pl")

  vars = {
    cmd = var.cmd
  }
}

resource "hcloud_server" "this" {
  name        = "${var.namespace}-server"
  image       = "ubuntu-24.04"
  server_type = "cpx51"
  location    = "hel1"

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  ssh_keys = [
    var.hcloud_ssh_key,
  ]
  user_data = data.template_file.this.rendered
}