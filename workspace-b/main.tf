terraform {
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

data "tfe_outputs" "A" {
  organization = "hashicorp-31883-a"
  workspace    = "test-31883-x"
}

output "test1" {
  value = {
    rgp_name = nonsensitive(data.tfe_outputs.A.values)
    rgp_id = nonsensitive(data.tfe_outputs.A.values)
  }
}

output "test2" {
  value = data.tfe_outputs.A.values
  sensitive = true
}
