variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "vm_size" {}
variable "admin_username" {}
variable "public_key_path" {}

variable "tags" {
  type = map(string)
}
