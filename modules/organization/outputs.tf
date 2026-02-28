output "id" {
  description = "The ID of the organization."
  value       = try(awx_organization.this[0].id, null)
}

output "name" {
  description = "The name of the organization."
  value       = try(awx_organization.this[0].name, null)
}
