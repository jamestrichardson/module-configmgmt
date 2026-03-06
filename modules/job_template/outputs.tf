output "id" {
  description = "The ID of the job template."
  value       = try(awx_job_template.this[0].id, null)
}

output "name" {
  description = "The name of the job template."
  value       = try(awx_job_template.this[0].name, null)
}

output "job_type" {
  description = "The job type of the template."
  value       = try(awx_job_template.this[0].job_type, null)
}

output "project_id" {
  description = "The project ID of the template."
  value       = try(awx_job_template.this[0].project_id, null)
}

output "inventory_id" {
  description = "The inventory ID of the template."
  value       = try(awx_job_template.this[0].inventory_id, null)
}
