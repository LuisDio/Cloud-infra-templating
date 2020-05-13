#-----root/outputs.tf------

#----storage output--------
output "bucket_name" {
  value = "${module.storage.bucket_name}"
}

#---Networking Output-------
output "public Subnets" {
  value = "${join(",", module.networking.public_subnets)}"
}

output "Subnet IPs" {
  value = "${join(",", module.networking.Subnet_ips)}"
}

output "Public Security Group" {
  value = "${module.networking.public_sg}"
}

#---Compute Output---------
output "Public Instance IDs" {
  value = "${module.compute.server_id}"
}

output "Public Instance IPs" {
  value = "${module.compute.server_ip}"
}

output "Public Security Group" {
  value = "${module.networking.public_sg}"
}





