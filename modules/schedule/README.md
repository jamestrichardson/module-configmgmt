# AWX Schedule Terraform Module

Terraform module which creates an [AWX Schedule](https://docs.ansible.com/ansible-tower/latest/html/userguide/scheduling.html) using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) provider.

**Provider:** [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) >= 0.24

## Usage

### Daily Schedule

```hcl
module "daily_backup" {
  source = "../../modules/schedule"

  name                    = "Daily Backup Schedule"
  unified_job_template_id = module.backup_job.id
  rrule                   = "DTSTART:20240101T020000Z RRULE:FREQ=DAILY;INTERVAL=1"
  enabled                 = true

  description = "Run backup job daily at 2 AM UTC"
}
```

### Weekly Schedule with Extra Variables

```hcl
module "weekly_maintenance" {
  source = "../../modules/schedule"

  name                    = "Weekly Maintenance"
  unified_job_template_id = module.maintenance_job.id
  rrule                   = "DTSTART:20240101T000000Z RRULE:FREQ=WEEKLY;BYDAY=SU;INTERVAL=1"
  enabled                 = true

  extra_data = jsonencode({
    maintenance_mode = true
    notification_email = "ops@example.com"
  })
}
```

### Hourly Schedule with Overrides

```hcl
module "hourly_check" {
  source = "../../modules/schedule"

  name                    = "Hourly Health Check"
  unified_job_template_id = module.health_check_job.id
  rrule                   = "DTSTART:20240101T000000Z RRULE:FREQ=HOURLY;INTERVAL=1"
  enabled                 = true

  job_type  = "check"
  diff_mode = true
  limit     = "webservers"
}
```

### Monthly Schedule

```hcl
module "monthly_report" {
  source = "../../modules/schedule"

  name                    = "Monthly Report Generation"
  unified_job_template_id = module.report_job.id
  rrule                   = "DTSTART:20240101T090000Z RRULE:FREQ=MONTHLY;BYMONTHDAY=1"
  enabled                 = true

  description = "Generate monthly reports on the 1st of each month at 9 AM UTC"
  verbosity   = 2
}
```

## Conditional Creation

```hcl
module "awx_schedule" {
  source = "../../modules/schedule"

  create = false

  name                    = "my-schedule"
  unified_job_template_id = 1
  rrule                   = "DTSTART:20240101T000000Z RRULE:FREQ=DAILY"
}
```

## RRULE Format

The `rrule` parameter uses the iCalendar (RFC5545) format. Common patterns:

- **Daily**: `DTSTART:20240101T020000Z RRULE:FREQ=DAILY;INTERVAL=1`
- **Weekly on Monday**: `DTSTART:20240101T000000Z RRULE:FREQ=WEEKLY;BYDAY=MO`
- **Every 2 hours**: `DTSTART:20240101T000000Z RRULE:FREQ=HOURLY;INTERVAL=2`
- **Monthly on 15th**: `DTSTART:20240101T000000Z RRULE:FREQ=MONTHLY;BYMONTHDAY=15`
- **Weekdays only**: `DTSTART:20240101T080000Z RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3 |
| <a name="requirement_awx"></a> [awx](#requirement_awx) | >= 0.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider_awx) | 0.29.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awx_schedule.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/schedule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this schedule. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input_enabled) | Whether this schedule is enabled. | `bool` | `true` | no |
| <a name="input_extra_data"></a> [extra_data](#input_extra_data) | Extra variables to pass to the job at launch time (JSON or YAML format). | `string` | `null` | no |
| <a name="input_inventory_id"></a> [inventory_id](#input_inventory_id) | Inventory ID to use for the scheduled job (overrides template default). | `number` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this schedule. | `string` | n/a | yes |
| <a name="input_rrule"></a> [rrule](#input_rrule) | A recurrence rule (RFC5545) that defines when this schedule should run. | `string` | n/a | yes |
| <a name="input_unified_job_template_id"></a> [unified_job_template_id](#input_unified_job_template_id) | The ID of the unified job template (job template, workflow job template, project, or inventory source) to schedule. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled"></a> [enabled](#output_enabled) | Whether this schedule is enabled. |
| <a name="output_id"></a> [id](#output_id) | The ID of the schedule. |
| <a name="output_name"></a> [name](#output_name) | The name of the schedule. |
| <a name="output_unified_job_template_id"></a> [unified_job_template_id](#output_unified_job_template_id) | The unified job template ID for this schedule. |
<!-- END_TF_DOCS -->
