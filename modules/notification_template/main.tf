locals {
  create = var.create
}

resource "awx_notification_template" "this" {
  count = local.create ? 1 : 0

  name                       = var.name
  notification_type          = var.notification_type
  notification_configuration = var.notification_configuration
  organization_id            = var.organization_id
  description                = var.description
}
