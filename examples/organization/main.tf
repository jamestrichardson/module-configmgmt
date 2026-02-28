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
  description = "Example AWX Organization managed by Terraform"
  max_hosts   = 100
}
