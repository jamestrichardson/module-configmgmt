output "id" {
  description = "The ID of the credential."
  value       = try(awx_credential.this[0].id, null)
}

output "name" {
  description = "The name of the credential."
  value       = try(awx_credential.this[0].name, null)
}

output "organization_id" {
  description = "The organization ID the credential belongs to."
  value       = try(awx_credential.this[0].organization_id, null)
}

output "credential_type_id" {
  description = "The credential type ID."
  value       = try(awx_credential.this[0].credential_type_id, null)
}
