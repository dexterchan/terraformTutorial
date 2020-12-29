
terraform {
  backend "remote" {
    organization = "dextest"

    workspaces {
      name = "azure_learn_basic"
    }
  }
}
