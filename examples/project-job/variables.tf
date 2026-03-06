variable "awx_hostname" {
  description = "The URL of the AWX instance."
  type        = string
  default     = "http://localhost"
}

variable "awx_username" {
  description = "The AWX admin username."
  type        = string
  default     = "admin"
}

variable "awx_password" {
  description = "The AWX admin password."
  type        = string
  sensitive   = true
}

variable "awx_insecure" {
  description = "Allow insecure SSL connections."
  type        = bool
  default     = false
}

variable "name_prefix" {
  description = "Prefix to use for all AWX resource names."
  type        = string
  default     = "demo"
}

variable "scm_username" {
  description = "Username for the source control credential."
  type        = string
  default     = ""
}

variable "scm_password" {
  description = "Password for the source control credential."
  type        = string
  sensitive   = true
  default     = ""
}

variable "scm_credential_type_id" {
  description = "AWX credential type ID for source control (2 = Source Control)."
  type        = number
  default     = 2
}

variable "project_scm_url" {
  description = "Git URL for the project."
  type        = string
  default     = "https://github.com/ansible/ansible-examples.git"
}

variable "project_scm_branch" {
  description = "Git branch for the project."
  type        = string
  default     = "master"
}

variable "job_playbook" {
  description = "Playbook to run in the job template."
  type        = string
  default     = "lamp_simple/site.yml"
}

variable "schedule_rrule" {
  description = "Schedule recurrence rule (RFC5545 format)."
  type        = string
  default     = "DTSTART:20240101T020000Z RRULE:FREQ=DAILY;INTERVAL=1"
}

variable "schedule_enabled" {
  description = "Whether the schedule is enabled."
  type        = bool
  default     = false
}

variable "enable_notifications" {
  description = "Enable Slack notifications."
  type        = bool
  default     = false
}

variable "slack_token" {
  description = "Slack bot token for notifications."
  type        = string
  sensitive   = true
  default     = ""
}

variable "slack_channels" {
  description = "Slack channels for notifications."
  type        = list(string)
  default     = ["#alerts"]
}
