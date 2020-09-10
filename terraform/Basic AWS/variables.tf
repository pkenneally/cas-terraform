
variable "region" {
  type = string
  default = "us-east-2"
}

variable "ssh_key_name" {
  type = string
  default = "changeMeToAnExistingKeyPair"
}

variable "hostname" {
    type = string
    default = "changeMe"
}
