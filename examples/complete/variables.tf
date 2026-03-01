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

variable "name_prefix" {
  description = "Prefix to use for all AWX resource names."
  type        = string
  default     = "example"
}

variable "max_hosts" {
  description = "Maximum number of hosts for the organization."
  type        = number
  default     = 100
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
