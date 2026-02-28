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

module "organization" {
  source = "../../modules/organization"

  name        = "example-org"
  description = "Example AWX Organization"
}

module "inventory" {
  source = "../../modules/inventory"

  name            = "example-inventory"
  organization_id = module.organization.id
  description     = "Example AWX Inventory"

  variables = <<-YAML
    ---
    ansible_connection: ssh
    ansible_user: ansible
  YAML

  groups = {
    web = {
      name        = "web-servers"
      description = "Web server group"
      variables   = "---\nhttp_port: 80\n"
    }
    db = {
      name        = "db-servers"
      description = "Database server group"
    }
  }
}
