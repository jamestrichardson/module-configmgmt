# AWX Notification Template Terraform Module

Terraform module which creates an [AWX Notification Template](https://docs.ansible.com/ansible-tower/latest/html/userguide/notifications.html) using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) provider.

**Provider:** [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) >= 0.24

## Usage

### Slack Notification

```hcl
module "slack_notifications" {
  source = "../../modules/notification_template"

  name              = "Slack Ops Channel"
  notification_type = "slack"
  organization_id   = module.organization.id

  notification_configuration = jsonencode({
    token   = var.slack_token
    channels = ["#ops-alerts"]
  })

  messages = jsonencode({
    started = {
      message = "Job {{ job_friendly_name }} started"
    }
    success = {
      message = "Job {{ job_friendly_name }} completed successfully"
    }
    error = {
      message = "Job {{ job_friendly_name }} failed!"
    }
  })
}
```

### Email Notification

```hcl
module "email_notifications" {
  source = "../../modules/notification_template"

  name              = "Team Email Alerts"
  notification_type = "email"
  organization_id   = module.organization.id

  notification_configuration = jsonencode({
    host     = "smtp.example.com"
    port     = 587
    use_tls  = true
    username = var.smtp_username
    password = var.smtp_password
    sender   = "awx@example.com"
    recipients = ["team@example.com"]
  })

  description = "Email notifications for critical job failures"
}
```

### Webhook Notification

```hcl
module "webhook_notifications" {
  source = "../../modules/notification_template"

  name              = "CI/CD Webhook"
  notification_type = "webhook"
  organization_id   = module.organization.id

  notification_configuration = jsonencode({
    url = "https://api.example.com/awx-webhook"
    headers = {
      "Authorization" = "Bearer ${var.webhook_token}"
      "Content-Type"  = "application/json"
    }
    http_method = "POST"
  })
}
```

### PagerDuty Notification

```hcl
module "pagerduty_notifications" {
  source = "../../modules/notification_template"

  name              = "PagerDuty On-Call"
  notification_type = "pagerduty"
  organization_id   = module.organization.id

  notification_configuration = jsonencode({
    token         = var.pagerduty_token
    subdomain     = "mycompany"
    service_key   = var.pagerduty_service_key
    client_name   = "AWX"
  })

  description = "Alert on-call team via PagerDuty"
}
```

### Mattermost Notification

```hcl
module "mattermost_notifications" {
  source = "../../modules/notification_template"

  name              = "Mattermost DevOps"
  notification_type = "mattermost"

  notification_configuration = jsonencode({
    url      = "https://mattermost.example.com/hooks/xxx"
    username = "AWX Bot"
    channel  = "devops"
    icon_url = "https://example.com/awx-icon.png"
  })
}
```

## Conditional Creation

```hcl
module "awx_notification_template" {
  source = "../../modules/notification_template"

  create = false

  name              = "my-notification"
  notification_type = "email"
  notification_configuration = "{}"
}
```

## Notification Types

Supported notification types and their required configuration fields:

### Email
```json
{
  "host": "smtp.example.com",
  "port": 587,
  "username": "user@example.com",
  "password": "secret",
  "sender": "awx@example.com",
  "recipients": ["team@example.com"],
  "use_tls": true,
  "use_ssl": false
}
```

### Slack
```json
{
  "token": "xoxb-slack-bot-token",
  "channels": ["#channel-name"]
}
```

### Webhook
```json
{
  "url": "https://api.example.com/webhook",
  "http_method": "POST",
  "headers": {
    "Authorization": "Bearer token"
  }
}
```

### PagerDuty
```json
{
  "token": "pagerduty-api-token",
  "subdomain": "mycompany",
  "service_key": "service-key",
  "client_name": "AWX"
}
```

## Custom Messages

Customize notification messages using template variables:

```json
{
  "started": {
    "message": "Job {{ job_friendly_name }} (#{{ job.id }}) started by {{ job.created_by }}"
  },
  "success": {
    "message": "✅ Job {{ job_friendly_name }} completed in {{ job.elapsed }} seconds"
  },
  "error": {
    "message": "❌ Job {{ job_friendly_name }} failed! Check: {{ job.url }}"
  },
  "workflow_approval": {
    "message": "Approval needed for workflow {{ workflow_job_friendly_name }}"
  }
}
```

Available template variables:
- `{{ job_friendly_name }}`
- `{{ job.id }}`
- `{{ job.status }}`
- `{{ job.created_by }}`
- `{{ job.url }}`
- `{{ job.elapsed }}`
- `{{ workflow_job_friendly_name }}`
- `{{ approval_node_name }}`

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
| [awx_notification_template.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/notification_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this notification template. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this notification template. | `string` | n/a | yes |
| <a name="input_notification_configuration"></a> [notification_configuration](#input_notification_configuration) | Configuration settings for the notification type (JSON encoded). Structure varies by notification_type. | `string` | n/a | yes |
| <a name="input_notification_type"></a> [notification_type](#input_notification_type) | The type of notification. Valid values: email, slack, pagerduty, twilio, webhook, mattermost, grafana, irc, rocketchat. | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization_id](#input_organization_id) | The organization ID to associate with this notification template. | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the notification template. |
| <a name="output_name"></a> [name](#output_name) | The name of the notification template. |
| <a name="output_notification_type"></a> [notification_type](#output_notification_type) | The notification type. |
| <a name="output_organization_id"></a> [organization_id](#output_organization_id) | The organization ID associated with this notification template. |
<!-- END_TF_DOCS -->
