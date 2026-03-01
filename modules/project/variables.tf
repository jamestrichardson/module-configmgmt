variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this project."
  type        = string
}

variable "organization_id" {
  description = "Numeric ID of the organization this project belongs to."
  type        = number
}

variable "scm_type" {
  description = "Type of SCM. Valid values: git, svn, insights, archive. Use empty string for manual project."
  type        = string
  default     = "git"
}

variable "scm_url" {
  description = "URL to the SCM repository."
  type        = string
  default     = null
}

variable "scm_branch" {
  description = "Branch, tag, or commit to checkout. Defaults to the SCM's default branch."
  type        = string
  default     = null
}

variable "scm_clean" {
  description = "Remove any local modifications prior to performing an update."
  type        = bool
  default     = false
}

variable "scm_delete_on_update" {
  description = "Delete the local repository in its entirety prior to performing an update."
  type        = bool
  default     = false
}

variable "scm_update_on_launch" {
  description = "Update the project when a job using the project is launched."
  type        = bool
  default     = false
}

variable "scm_update_cache_timeout" {
  description = "The number of seconds after the last project update before a new update is triggered by a job launch."
  type        = number
  default     = 0
}

variable "credential_id" {
  description = "Numeric ID of the credential to use for SCM access."
  type        = number
  default     = null
}

variable "description" {
  description = "Optional description of this project."
  type        = string
  default     = null
}

variable "local_path" {
  description = "Local path (relative to PROJECTS_ROOT) containing playbooks and related files for this project."
  type        = string
  default     = null
}

variable "allow_override" {
  description = "Allow admins to change ansible variables at launch time."
  type        = bool
  default     = false
}
