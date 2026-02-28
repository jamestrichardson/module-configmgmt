locals {
  create = var.create
}

resource "awx_credential" "this" {
  count = local.create ? 1 : 0

  name               = var.name
  organization_id    = var.organization_id
  credential_type_id = var.credential_type_id
  description        = var.description
  inputs             = var.inputs
}
