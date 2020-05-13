#----root/outputs.tf-----

#----storage outputs------

output "Bucket Name" {
  value = "${module.storage.bucket_name}"
}

#---Networking Outputs -----

output "Public Subnets" {
  value = "${join(", ", module.networking.public_subnets)}"
}

output "Subnet IPs" {
  value = "${join(", ", module.networking.subnet_ips)}"
}

output "Public Security Group" {
  value = "${module.networking.public_sg}"
  # These are network output
}

#---Compute Outputs ------

output "Public Instance IDs" {
  value = "${module.compute.server_id}"
  # These are compute output
}

output "Public Instance IPs" {
  value = "${module.compute.server_ip}"
  # These are compute output
}