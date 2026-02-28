output "inventory_id" {
  description = "The ID of the created inventory."
  value       = module.inventory.id
}

output "inventory_name" {
  description = "The name of the created inventory."
  value       = module.inventory.name
}

output "group_ids" {
  description = "Map of group names to their IDs."
  value       = module.inventory.group_ids
}
