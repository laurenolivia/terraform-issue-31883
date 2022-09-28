terraform {
  cloud {
      hostname = "tfcdev-2c13224a.ngrok.io"
      organization  = "hashicorp-31883-a"
      workspaces {
        name = "test-31883-x"
      }

  }
  required_providers {
    tfe = {
      version = "~> 0.35.0"
    }
  }
}

provider "tfe" {
  hostname = "tfcdev-2c13224a.ngrok.io"
  token    = "token"
}

resource "tfe_organization" "test" {
  name  = "hashicorp-31883-b"
  email = "lauren.burwell@hashicorp.com"
}

resource "tfe_workspace" "test-workspace" {
  name         = "test-31883-c"
  organization = tfe_organization.test.name
}

output "rgp" {
  value = {
    id   = tfe_workspace.test-workspace.id
    name = tfe_workspace.test-workspace.name

  }
  sensitive = true
}