locals {
  create = var.create
}

resource "awx_team" "this" {
  count = local.create ? 1 : 0

  name            = var.name
  organization_id = var.organization_id
  description     = var.description

  dynamic "role_entitlement" {
    for_each = var.role_entitlements

    content {
      role_id = role_entitlement.value.role_id
    }
  }
}
