variable "vm_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {}
variable "key_name" {}

variable "tags" {
  type = map(string)
}
