output "image_out" {
    description = "ID of the image"
    value = "${docker_image.image_id.latest}"
}