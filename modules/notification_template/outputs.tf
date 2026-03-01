output "id" {
  description = "The ID of the notification template."
  value       = try(awx_notification_template.this[0].id, null)
}

output "name" {
  description = "The name of the notification template."
  value       = try(awx_notification_template.this[0].name, null)
}

output "notification_type" {
  description = "The notification type."
  value       = try(awx_notification_template.this[0].notification_type, null)
}

output "organization_id" {
  description = "The organization ID associated with this notification template."
  value       = try(awx_notification_template.this[0].organization_id, null)
}
