locals {
  create = var.create
}

resource "awx_execution_environment" "this" {
  count = local.create ? 1 : 0

  name         = var.name
  image        = var.image
  description  = var.description
  organization = var.organization_id
  credential   = var.credential_id
  pull         = var.pull
}
