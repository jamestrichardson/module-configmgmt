locals {
  create = var.create
}

resource "awx_organization" "this" {
  count = local.create ? 1 : 0

  name              = var.name
  description       = var.description
  max_hosts         = var.max_hosts
  custom_virtualenv = var.custom_virtualenv
}
