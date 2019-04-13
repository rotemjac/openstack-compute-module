resource "openstack_compute_instance_v2" "web" {
  count           = "${var.number_of_servers}"
  name            = "web-server"

  image_id        = "${data.openstack_images_image_v2.cirros.id}"
  flavor_id       = "3"

  key_pair        = "my_key_pair_name"
  security_groups = ["${openstack_networking_secgroup_v2.web-sg.id}"]

  network {
    name = "${var.network_name}"
  }

  user_data = "${file("${path.module}/scripts/init.sh")}"

  metadata = {
    env = "DEV"
  }

}

resource "openstack_networking_floatingip_v2" "floatip_1" {
  count = "${var.number_of_servers}"
  pool  = "public"
}

resource "openstack_compute_floatingip_associate_v2" "myip" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.web.id}"
}


data "openstack_images_image_v2" "cirros" {
  name = "${var.image_name}"
}