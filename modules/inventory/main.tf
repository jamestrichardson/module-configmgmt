locals {
  create = var.create
}

resource "awx_inventory" "this" {
  count = local.create ? 1 : 0

  name            = var.name
  organization_id = var.organization_id
  description     = var.description
  kind            = var.kind
  host_filter     = var.host_filter
  variables       = var.variables
}

resource "awx_inventory_group" "this" {
  for_each = local.create ? var.groups : {}

  name         = each.value.name
  inventory_id = awx_inventory.this[0].id
  description  = try(each.value.description, null)
  variables    = try(each.value.variables, null)
}

resource "awx_inventory_source" "this" {
  for_each = local.create ? var.sources : {}

  name                 = each.value.name
  inventory_id         = awx_inventory.this[0].id
  source               = try(each.value.source, null)
  description          = try(each.value.description, null)
  credential_id        = try(each.value.credential_id, null)
  overwrite            = try(each.value.overwrite, null)
  overwrite_vars       = try(each.value.overwrite_vars, null)
  update_on_launch     = try(each.value.update_on_launch, null)
  update_cache_timeout = try(each.value.update_cache_timeout, null)
  source_vars          = try(each.value.source_vars, null)
  source_regions       = try(each.value.source_regions, null)
  instance_filters     = try(each.value.instance_filters, null)
  group_by             = try(each.value.group_by, null)
  host_filter          = try(each.value.host_filter, null)
  enabled_var          = try(each.value.enabled_var, null)
  enabled_value        = try(each.value.enabled_value, null)
  verbosity            = try(each.value.verbosity, null)
}
