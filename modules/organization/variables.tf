variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this organization."
  type        = string
}

variable "description" {
  description = "Optional description of this organization."
  type        = string
  default     = null
}

variable "max_hosts" {
  description = "Maximum number of hosts allowed to be managed by this organization."
  type        = number
  default     = null
}

variable "custom_virtualenv" {
  description = "Local absolute file path containing a custom Python virtualenv to use."
  type        = string
  default     = null
}
