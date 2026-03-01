variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this schedule."
  type        = string
}

variable "unified_job_template_id" {
  description = "The ID of the unified job template (job template, workflow job template, project, or inventory source) to schedule."
  type        = number
}

variable "rrule" {
  description = "A recurrence rule (RFC5545) that defines when this schedule should run."
  type        = string
}

variable "enabled" {
  description = "Whether this schedule is enabled."
  type        = bool
  default     = true
}

variable "description" {
  description = "Optional description of this schedule."
  type        = string
  default     = null
}

variable "extra_data" {
  description = "Extra variables to pass to the job at launch time (JSON or YAML format)."
  type        = string
  default     = null
}

variable "inventory_id" {
  description = "Inventory ID to use for the scheduled job (overrides template default)."
  type        = number
  default     = null
}
