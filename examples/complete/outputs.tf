output "organization_id" {
  description = "The ID of the organization."
  value       = module.organization.id
}

output "organization_name" {
  description = "The name of the organization."
  value       = module.organization.name
}

output "team_ops_id" {
  description = "The ID of the ops team."
  value       = module.team_ops.id
}

output "team_dev_id" {
  description = "The ID of the dev team."
  value       = module.team_dev.id
}

output "scm_credential_id" {
  description = "The ID of the SCM credential."
  value       = module.scm_credential.id
}

output "inventory_id" {
  description = "The ID of the inventory."
  value       = module.inventory.id
}

output "inventory_group_ids" {
  description = "Map of inventory group names to their IDs."
  value       = module.inventory.group_ids
}
