output "team_id" {
  description = "The ID of the created team."
  value       = module.team.id
}

output "team_name" {
  description = "The name of the created team."
  value       = module.team.name
}

output "organization_id" {
  description = "The ID of the organization the team belongs to."
  value       = module.team.organization_id
}
