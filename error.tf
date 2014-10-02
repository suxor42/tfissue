# Configure the DigitalOcean Provider
provider "digitalocean" {
    token = "${var.do_token}"
}

# Create master
resource "digitalocean_droplet" "error" {
    image = "ubuntu-14-04-x64"
    name = "error"
    count = 1
    region = "${var.region}"
    size = "${var.size}"
    ssh_keys = ["${var.ssh_keys}"]
    private_networking = true
    connection {
        user = "root"
        key_file = "/Users/suxor/.ssh/id_rsa"
    }
    provisioner "local-exec" {
        command = "echo ${digitalocean_droplet.error.ipv4_address_private}"
    }
    provisioner "remote-exec"{
        inline= [
            "zsh",
            "echo 1",
            "asdkfghsaflgö"
            #"curl -s http://example.com/test/files/blub.jpg -o test.jpg"
        ]
    }
}
