resource "azurerm_virtual_machine_extension" "ama" {

  name                 = "AzureMonitorAgent"
  virtual_machine_id   = var.vm_id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.0"
}
