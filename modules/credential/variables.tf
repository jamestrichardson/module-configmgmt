variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this credential."
  type        = string
}

variable "organization_id" {
  description = "Numeric ID of the organization this credential belongs to."
  type        = number
}

variable "credential_type_id" {
  description = "Numeric ID of the credential type. Refer to the AWX API or UI to look up credential type IDs."
  type        = number
}

variable "description" {
  description = "Optional description of this credential."
  type        = string
  default     = null
}

variable "inputs" {
  description = "JSON or YAML encoded credential inputs. The fields required depend on the credential type."
  type        = string
  sensitive   = true
}
