# Output the IP address of the container
output "ip_address" {
  description = " container IP address"
  value = "${docker_container.container_id}"
}

output "host_name" {
  description = "container host name"
  value = "${docker_container.container_id.name}"
}
