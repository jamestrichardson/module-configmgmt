output "id" {
  description = "The ID of the execution environment."
  value       = try(awx_execution_environment.this[0].id, null)
}

output "name" {
  description = "The name of the execution environment."
  value       = try(awx_execution_environment.this[0].name, null)
}

output "image" {
  description = "The container image for this execution environment."
  value       = try(awx_execution_environment.this[0].image, null)
}

output "organization_id" {
  description = "The organization ID associated with this execution environment."
  value       = try(awx_execution_environment.this[0].organization, null)
}
