terraform {
  required_version = ">= 1.3"

  required_providers {
    awx = {
      source  = "denouche/awx"
      version = ">= 0.24"
    }
  }
}

provider "awx" {
  hostname = var.awx_hostname
  username = var.awx_username
  password = var.awx_password
  insecure = var.awx_insecure
}

# Organization
module "organization" {
  source = "../../modules/organization"

  name        = "${var.name_prefix}-org"
  description = "Example organization for project and job template demo"
  max_hosts   = 50
}

# SCM Credential
module "scm_credential" {
  source = "../../modules/credential"

  name               = "${var.name_prefix}-git-cred"
  organization_id    = module.organization.id
  credential_type_id = var.scm_credential_type_id

  inputs = jsonencode({
    username = var.scm_username
    password = var.scm_password
  })

  description = "Git credentials for project checkout"
}

# Project
module "project" {
  source = "../../modules/project"

  name            = "${var.name_prefix}-project"
  organization_id = module.organization.id
  scm_type        = "git"
  scm_url         = var.project_scm_url
  scm_branch      = var.project_scm_branch
  credential_id   = module.scm_credential.id

  scm_update_on_launch     = true
  scm_update_cache_timeout = 86400

  description = "Ansible playbooks project"
}

# Inventory
module "inventory" {
  source = "../../modules/inventory"

  name            = "${var.name_prefix}-inventory"
  organization_id = module.organization.id
  description     = "Demo inventory"

  variables = jsonencode({
    ansible_connection = "local"
  })
}

# Job Template
module "job_template" {
  source = "../../modules/job_template"

  name         = "${var.name_prefix}-deploy-job"
  job_type     = "run"
  inventory_id = module.inventory.id
  project_id   = module.project.id
  playbook     = var.job_playbook

  description    = "Deployment job template"
  become_enabled = true
  verbosity      = 1
  credential_id  = module.scm_credential.id

  extra_vars = jsonencode({
    environment = "demo"
    app_version = "1.0.0"
  })
}

# Schedule
module "schedule" {
  source = "../../modules/schedule"

  name                    = "${var.name_prefix}-daily-schedule"
  unified_job_template_id = module.job_template.id
  rrule                   = var.schedule_rrule
  enabled                 = var.schedule_enabled

  description = "Daily automated deployment"
}

# Notification Template
module "slack_notification" {
  source = "../../modules/notification_template"

  count = var.enable_notifications ? 1 : 0

  name              = "${var.name_prefix}-slack-notifications"
  notification_type = "slack"
  organization_id   = module.organization.id

  notification_configuration = jsonencode({
    token    = var.slack_token
    channels = var.slack_channels
  })

  description = "Slack notifications for job status"
}
