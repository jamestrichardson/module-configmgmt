locals {
  create = var.create

  credential_ids = distinct(concat(
    var.credential_id == null ? [] : [var.credential_id],
    var.credential_ids
  ))
}

resource "awx_job_template" "this" {
  count = local.create ? 1 : 0

  name                     = var.name
  job_type                 = var.job_type
  inventory_id             = var.inventory_id
  project_id               = var.project_id
  playbook                 = var.playbook
  description              = var.description
  ask_credential_on_launch = var.ask_credential_on_launch
  ask_inventory_on_launch  = var.ask_inventory_on_launch
  ask_job_type_on_launch   = var.ask_job_type_on_launch
  ask_limit_on_launch      = var.ask_limit_on_launch
  ask_skip_tags_on_launch  = var.ask_skip_tags_on_launch
  ask_tags_on_launch       = var.ask_tags_on_launch
  ask_variables_on_launch  = var.ask_variables_on_launch
  become_enabled           = var.become_enabled
  diff_mode                = var.diff_mode
  extra_vars               = var.extra_vars
  forks                    = var.forks
  host_config_key          = var.host_config_key
  job_tags                 = var.job_tags
  limit                    = var.limit
  skip_tags                = var.skip_tags
  start_at_task            = var.start_at_task
  timeout                  = var.timeout
  use_fact_cache           = var.use_fact_cache
  verbosity                = var.verbosity
  allow_simultaneous       = var.allow_simultaneous
  force_handlers           = var.force_handlers
}

resource "awx_job_template_credential" "this" {
  for_each = local.create ? {
    for credential_id in local.credential_ids : tostring(credential_id) => credential_id
  } : {}

  job_template_id = awx_job_template.this[0].id
  credential_id   = each.value
}
