variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this notification template."
  type        = string
}

variable "notification_type" {
  description = "The type of notification. Valid values: email, slack, pagerduty, twilio, webhook, mattermost, grafana, irc, rocketchat."
  type        = string
}

variable "notification_configuration" {
  description = "Configuration settings for the notification type (JSON encoded). Structure varies by notification_type."
  type        = string
  sensitive   = true
}

variable "organization_id" {
  description = "The organization ID to associate with this notification template."
  type        = number
  default     = null
}

variable "description" {
  description = "Optional description of this notification template."
  type        = string
  default     = null
}
