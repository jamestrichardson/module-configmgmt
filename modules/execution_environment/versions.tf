terraform {
  required_version = ">= 1.3"

  required_providers {
    awx = {
      source  = "ilijamt/awx"
      version = ">= 0.7"
    }
  }
}
