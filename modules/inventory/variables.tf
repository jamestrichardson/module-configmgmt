variable "create" {
  description = "Controls whether resources should be created."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of this inventory."
  type        = string
}

variable "organization_id" {
  description = "Numeric ID of the organization this inventory belongs to."
  type        = number
}

variable "description" {
  description = "Optional description of this inventory."
  type        = string
  default     = null
}

variable "kind" {
  description = "Kind of inventory. Valid values are empty string (regular inventory) or `smart`."
  type        = string
  default     = null
}

variable "host_filter" {
  description = "Filter that will be applied to the hosts of this inventory."
  type        = string
  default     = null
}

variable "variables" {
  description = "YAML or JSON inventory variables."
  type        = string
  default     = null
}

variable "groups" {
  description = <<-EOT
    Map of inventory groups to create. Keys are logical group identifiers used
    within this module. Each group object supports:
      - name        (Required) Name of the group
      - description (Optional) Description of the group
      - variables   (Optional) YAML or JSON group variables
  EOT
  type        = any
  default     = {}
}

variable "sources" {
  description = <<-EOT
    Map of inventory sources to create. Keys are logical source identifiers used
    within this module. Each source object supports:
      - name                 (Required) Name of the inventory source
      - source               (Optional) Source type (e.g. "scm", "ec2", "gce")
      - description          (Optional) Description
      - credential_id        (Optional) Credential ID
      - overwrite            (Optional) Overwrite local groups and hosts from remote inventory source
      - overwrite_vars       (Optional) Overwrite local variables from remote inventory source
      - update_on_launch     (Optional) Update on launch
      - update_cache_timeout (Optional) Cache timeout in seconds
      - source_vars          (Optional) Source variables in YAML or JSON format
      - source_regions       (Optional) Regions for cloud sources
      - instance_filters     (Optional) Comma-separated list of filter expressions
      - group_by             (Optional) Comma-separated list of groups to organize hosts into
      - host_filter          (Optional) Regex to filter hosts
      - enabled_var          (Optional) Variable to use to determine enabled state
      - enabled_value        (Optional) Value for enabled_var to consider host enabled
      - verbosity            (Optional) Verbosity level (0-2)
  EOT
  type        = any
  default     = {}
}
