output "instances_ids" {
  value = "${openstack_compute_instance_v2.web.*.id}"
}

