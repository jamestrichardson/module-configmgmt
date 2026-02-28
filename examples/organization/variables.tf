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
