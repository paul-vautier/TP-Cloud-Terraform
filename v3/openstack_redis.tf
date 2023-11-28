data "openstack_compute_keypair_v2" "os_kp" {
  name = var.os_key_name
}

data "openstack_images_image_v2" "imta" {
  name        = "imta-ubuntu22"
  most_recent = true
}

resource "openstack_compute_instance_v2" "redis_db" {
  name            = "redis"
  image_name      = data.openstack_images_image_v2.imta.name
  flavor_name     = "m1.small"
  key_pair        = data.openstack_compute_keypair_v2.os_kp.name
  security_groups = [ "sg-open" ]
  
  user_data = templatefile("./install-redis.sh", {})

  network {
    name = "internal"
  }
}

# Floating IP
resource "openstack_networking_floatingip_v2" "redis_ip" {
  pool = "external"
}
resource "openstack_compute_floatingip_associate_v2" "redis_ip_assoc" {
  floating_ip = openstack_networking_floatingip_v2.redis_ip.address
  instance_id = openstack_compute_instance_v2.redis_db.id
}

# Outputs
output "redis_floating_ip" {
  value       = openstack_networking_floatingip_v2.redis_ip.address
  description = "Floating IP associated to the VM"
}
