locals {
  create = var.create
}

resource "awx_project" "this" {
  count = local.create ? 1 : 0

  name                     = var.name
  organization_id          = var.organization_id
  scm_type                 = var.scm_type
  scm_url                  = var.scm_url
  scm_branch               = var.scm_branch
  scm_clean                = var.scm_clean
  scm_delete_on_update     = var.scm_delete_on_update
  scm_update_on_launch     = var.scm_update_on_launch
  scm_update_cache_timeout = var.scm_update_cache_timeout
  scm_credential_id        = var.credential_id
  description              = var.description
  local_path               = var.local_path
  allow_override           = var.allow_override
}
