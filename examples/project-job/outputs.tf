output "organization_id" {
  description = "The ID of the created organization."
  value       = module.organization.id
}

output "project_id" {
  description = "The ID of the created project."
  value       = module.project.id
}

output "job_template_id" {
  description = "The ID of the created job template."
  value       = module.job_template.id
}

output "schedule_id" {
  description = "The ID of the created schedule."
  value       = module.schedule.id
}

output "notification_template_id" {
  description = "The ID of the notification template."
  value       = var.enable_notifications ? module.slack_notification[0].id : null
}
