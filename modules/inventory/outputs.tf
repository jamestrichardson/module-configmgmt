output "id" {
  description = "The ID of the inventory."
  value       = try(awx_inventory.this[0].id, null)
}

output "name" {
  description = "The name of the inventory."
  value       = try(awx_inventory.this[0].name, null)
}

output "organization_id" {
  description = "The organization ID the inventory belongs to."
  value       = try(awx_inventory.this[0].organization_id, null)
}

output "group_ids" {
  description = "Map of group logical names to their IDs."
  value       = { for k, v in awx_inventory_group.this : k => v.id }
}

output "source_ids" {
  description = "Map of source logical names to their IDs."
  value       = { for k, v in awx_inventory_source.this : k => v.id }
}
