terraform {
  required_version = ">= 1.3"

  required_providers {
    awx = {
      source  = "denouche/awx"
      version = ">= 0.24"
    }
  }
}
