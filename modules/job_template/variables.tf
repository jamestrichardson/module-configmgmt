variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this job template."
  type        = string
}

variable "job_type" {
  description = "Job type. Valid values: run, check."
  type        = string
  default     = "run"
}

variable "inventory_id" {
  description = "Inventory ID for the job template."
  type        = number
}

variable "project_id" {
  description = "Project ID for the job template."
  type        = number
}

variable "playbook" {
  description = "Playbook to run from the project."
  type        = string
}

variable "description" {
  description = "Optional description of this job template."
  type        = string
  default     = null
}

variable "ask_credential_on_launch" {
  description = "Prompt for credential on launch."
  type        = bool
  default     = false
}

variable "credential_id" {
  description = "Optional single credential ID to attach to the job template."
  type        = number
  default     = null
}

variable "credential_ids" {
  description = "Optional list of credential IDs to attach to the job template. Any value in credential_id is included automatically."
  type        = list(number)
  default     = []
}

variable "ask_inventory_on_launch" {
  description = "Prompt for inventory on launch."
  type        = bool
  default     = false
}

variable "ask_job_type_on_launch" {
  description = "Prompt for job type on launch."
  type        = bool
  default     = false
}

variable "ask_limit_on_launch" {
  description = "Prompt for limit on launch."
  type        = bool
  default     = false
}

variable "ask_skip_tags_on_launch" {
  description = "Prompt for skip tags on launch."
  type        = bool
  default     = false
}

variable "ask_tags_on_launch" {
  description = "Prompt for tags on launch."
  type        = bool
  default     = false
}

variable "ask_variables_on_launch" {
  description = "Prompt for extra variables on launch."
  type        = bool
  default     = false
}

variable "become_enabled" {
  description = "Enable privilege escalation."
  type        = bool
  default     = false
}

variable "diff_mode" {
  description = "Show changes made by Ansible tasks."
  type        = bool
  default     = false
}

variable "extra_vars" {
  description = "Extra variables for the job template in YAML or JSON format."
  type        = string
  default     = null
}

variable "forks" {
  description = "Number of parallel processes to use."
  type        = number
  default     = 0
}

variable "host_config_key" {
  description = "Allow provisioning callbacks using this host config key."
  type        = string
  default     = null
  sensitive   = true
}

variable "job_tags" {
  description = "Comma-separated list of playbook tags to run."
  type        = string
  default     = null
}

variable "limit" {
  description = "Limit the execution to a subset of the inventory."
  type        = string
  default     = null
}

variable "skip_tags" {
  description = "Comma-separated list of playbook tags to skip."
  type        = string
  default     = null
}

variable "start_at_task" {
  description = "Start the playbook at this task."
  type        = string
  default     = null
}

variable "timeout" {
  description = "Maximum time in seconds for the job to run (0 = no timeout)."
  type        = number
  default     = 0
}

variable "use_fact_cache" {
  description = "Use cached facts if available."
  type        = bool
  default     = false
}

variable "verbosity" {
  description = "Ansible verbosity level (0-5)."
  type        = number
  default     = 0
}

variable "allow_simultaneous" {
  description = "Allow multiple jobs from this template to run at once."
  type        = bool
  default     = false
}

variable "force_handlers" {
  description = "Force Ansible to run handlers even if a task fails."
  type        = bool
  default     = false
}
