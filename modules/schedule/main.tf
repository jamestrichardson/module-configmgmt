locals {
  create = var.create
}

resource "awx_schedule" "this" {
  count = local.create ? 1 : 0

  name                    = var.name
  unified_job_template_id = var.unified_job_template_id
  rrule                   = var.rrule
  enabled                 = var.enabled
  description             = var.description
  extra_data              = var.extra_data
  inventory               = var.inventory_id
}
