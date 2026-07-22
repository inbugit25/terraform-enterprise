resource "azurerm_backup_protected_vm" "backup" {

  resource_group_name = var.recovery_vault_rg
  recovery_vault_name = var.recovery_vault_name

  source_vm_id = var.vm_id

  backup_policy_id = var.backup_policy_id
}
