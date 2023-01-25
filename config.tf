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
  token   = "hvs.EqbmHiyE4l1PNr8ZSgRqje98"
  address = "http://172.18.0.128:8200"
}
