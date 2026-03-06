output "id" {
  description = "The ID of the schedule."
  value       = try(awx_schedule.this[0].id, null)
}

output "name" {
  description = "The name of the schedule."
  value       = try(awx_schedule.this[0].name, null)
}

output "unified_job_template_id" {
  description = "The unified job template ID for this schedule."
  value       = try(awx_schedule.this[0].unified_job_template_id, null)
}

output "enabled" {
  description = "Whether this schedule is enabled."
  value       = try(awx_schedule.this[0].enabled, null)
}
