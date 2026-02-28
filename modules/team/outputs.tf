output "id" {
  description = "The ID of the team."
  value       = try(awx_team.this[0].id, null)
}

output "name" {
  description = "The name of the team."
  value       = try(awx_team.this[0].name, null)
}

output "organization_id" {
  description = "The organization ID the team belongs to."
  value       = try(awx_team.this[0].organization_id, null)
}
