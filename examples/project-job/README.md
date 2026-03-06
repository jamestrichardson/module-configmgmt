# Project and Job Template Example

This example demonstrates how to create a complete AWX automation setup including:

- Organization
- SCM credentials for Git access
- Project linked to a Git repository
- Inventory
- Job Template for running playbooks
- Schedule for automated execution
- Notification Template for Slack alerts (optional)

## Usage

1. Set AWX credentials:
```bash
export TF_VAR_awx_hostname="https://awx.example.com"
export TF_VAR_awx_username="admin"
export TF_VAR_awx_password="your-password"
```

2. Configure Git credentials (if repository is private):
```bash
export TF_VAR_scm_username="git-user"
export TF_VAR_scm_password="git-token"
```

3. Initialize and apply:
```bash
terraform init
terraform apply
```

## Optional Features

### Enable Scheduled Runs

```bash
export TF_VAR_schedule_enabled=true
terraform apply
```

### Enable Slack Notifications

```bash
export TF_VAR_enable_notifications=true
export TF_VAR_slack_token="xoxb-your-slack-token"
export TF_VAR_slack_channels='["#devops", "#alerts"]'
terraform apply
```

### Use Custom Project

```bash
export TF_VAR_project_scm_url="https://github.com/your-org/playbooks.git"
export TF_VAR_project_scm_branch="main"
export TF_VAR_job_playbook="site.yml"
terraform apply
```

## What Gets Created

- **Organization**: `demo-org`
- **Git Credential**: `demo-git-cred` (for SCM authentication)
- **Project**: `demo-project` (synced from Git)
- **Inventory**: `demo-inventory`
- **Job Template**: `demo-deploy-job`
- **Schedule**: `demo-daily-schedule` (runs daily at 2 AM UTC if enabled)
- **Notification Template**: `demo-slack-notifications` (if enabled)

## Running the Job Manually

After creating resources, you can launch the job from AWX UI or via API:

```bash
awx job_templates launch <job_template_id>
```

## Cleaning Up

```bash
terraform destroy
```
