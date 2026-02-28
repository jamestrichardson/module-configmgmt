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
}

################################################################################
# Organization
################################################################################

module "organization" {
  source = "../../modules/organization"

  name        = "${var.name_prefix}-org"
  description = "Organization managed by Terraform"
  max_hosts   = var.max_hosts
}

################################################################################
# Teams
################################################################################

module "team_ops" {
  source = "../../modules/team"

  name            = "${var.name_prefix}-ops"
  organization_id = module.organization.id
  description     = "Operations team"
}

module "team_dev" {
  source = "../../modules/team"

  name            = "${var.name_prefix}-dev"
  organization_id = module.organization.id
  description     = "Development team"
}

################################################################################
# Credential (SCM / Source Control)
################################################################################

data "awx_credential_type" "scm" {
  name = "Source Control"
}

module "scm_credential" {
  source = "../../modules/credential"

  name               = "${var.name_prefix}-scm"
  organization_id    = module.organization.id
  credential_type_id = data.awx_credential_type.scm.id
  description        = "Source control credential"

  inputs = jsonencode({
    username = var.scm_username
    password = var.scm_password
  })
}

################################################################################
# Inventory
################################################################################

module "inventory" {
  source = "../../modules/inventory"

  name            = "${var.name_prefix}-inventory"
  organization_id = module.organization.id
  description     = "Main inventory"

  variables = <<-YAML
    ---
    ansible_connection: ssh
    ansible_user: ansible
  YAML

  groups = {
    web = {
      name        = "web-servers"
      description = "Web server group"
    }
    db = {
      name        = "db-servers"
      description = "Database server group"
    }
  }
}
