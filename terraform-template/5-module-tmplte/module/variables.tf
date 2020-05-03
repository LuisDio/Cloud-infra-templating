variable "container_name" {
    description = "Name of the container"
    default = "blog"
}

variable "image_name" {
    description = "Image for the container"
    default = "ghost:latest"
}

variable "int_port" {
    description = "Internal Port for the container"
    default = "2368"
}

variable "ext_port" {
    description = "External port for container"
    default = "80"
}


