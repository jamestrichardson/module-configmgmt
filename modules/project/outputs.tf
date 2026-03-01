output "id" {
  description = "The ID of the project."
  value       = try(awx_project.this[0].id, null)
}

output "name" {
  description = "The name of the project."
  value       = try(awx_project.this[0].name, null)
}

output "organization_id" {
  description = "The organization ID the project belongs to."
  value       = try(awx_project.this[0].organization_id, null)
}

output "scm_type" {
  description = "The SCM type of the project."
  value       = try(awx_project.this[0].scm_type, null)
}
