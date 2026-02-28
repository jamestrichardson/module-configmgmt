variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this team."
  type        = string
}

variable "organization_id" {
  description = "Numeric ID of the organization this team belongs to."
  type        = number
}

variable "description" {
  description = "Optional description of this team."
  type        = string
  default     = null
}

variable "role_entitlements" {
  description = "List of role IDs to grant to this team. Each object must contain a `role_id` attribute."
  type = list(object({
    role_id = number
  }))
  default = []
}
