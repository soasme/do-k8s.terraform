variable "do_token" {}
variable "region" {}
variable "ssh_fingerprint" {}
variable "ssh_privatekey" {}
variable "image" {}
variable "workers" {}

provider "digitalocean" {
    token = "${var.do_token}"
    version = "~> 0.1"
}

resource "digitalocean_droplet" "kube_master" {
    image = "${var.image}"
    name = "kube_master"
    region = "${var.region}"
    private_networking = true
    size = "s-1vcpu-1gb"
    ssh_keys = ["${var.ssh_fingerprint}"]
}

resource "digitalocean_droplet" "kube_worker" {
    count = "${var.workers}"
    image = "${var.image}"
    name = "${format("kube-worker-%03d", count.index + 1)}"
    region = "${var.region}"
    private_networking = true
    size = "s-1vcpu-1gb"
    ssh_keys = ["${var.ssh_fingerprint}"]
}
