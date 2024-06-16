provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      managed-by  = "terraform"
      github-repo = "alissonpdc/curso-terraform-basico-ao-avancado"
      environment = "dev"
    }
  }
}
