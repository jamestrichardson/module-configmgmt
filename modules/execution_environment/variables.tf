variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this execution environment."
  type        = string
}

variable "image" {
  description = "The full image location, including the container registry, image name, and version tag."
  type        = string
}

variable "description" {
  description = "Optional description of this execution environment."
  type        = string
  default     = null
}

variable "organization_id" {
  description = "The organization ID to associate with this execution environment."
  type        = number
  default     = null
}

variable "credential_id" {
  description = "The credential ID to use for authenticating to the container registry."
  type        = number
  default     = null
}

variable "pull" {
  description = "The pull behavior for the container image. Valid values: always, missing, never."
  type        = string
  default     = "missing"
}
