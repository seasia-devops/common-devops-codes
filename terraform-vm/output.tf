output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.example.name
}

output "subnet_name" {
  value = azurerm_subnet.example.name
}

output "public_ip" {
  value = azurerm_public_ip.example.ip_address
}

output "vm_id" {
  value = azurerm_virtual_machine.example.id
}