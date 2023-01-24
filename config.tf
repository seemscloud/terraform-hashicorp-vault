terraform {
  backend "local" {
    path = ".states/terraform.tfstate"
  }
}

terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.12.0"
    }
  }
}

provider "vault" {
  token   = "hvs.jGCTvlwYorKMicVq5SO3l89a"
  address = "http://172.18.0.128:8200"
}
