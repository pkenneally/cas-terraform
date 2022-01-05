
variable "region" {
  type = string
  default = "eu-west-1"
}

variable "ssh_key_name" {
  type = string
  default = "changeMeToAnExistingKeyPair"
}

variable "hostname" {
    type = string
    default = "changeMe"
}
