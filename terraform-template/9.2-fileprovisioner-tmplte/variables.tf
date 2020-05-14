variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {}

variable "AMIS" {
    type = "map"
    default = {
        us-east-1 = "ami-03e33c1cefd1d3d74",
        us-east-2 = "ami-07d9419c80dc1113c",
        us-west-1 = "ami-0ee1a20d6b0c6a347",
        us-west-2 = "ami-0813245c0939ab3ca"
    } 
}

variable "PATH_TO_PUBLIC_KEY" {}

variable "PATH_TO_PRIVATE_KEY" {}

variable "INSTANCE_USERNAME" {}



