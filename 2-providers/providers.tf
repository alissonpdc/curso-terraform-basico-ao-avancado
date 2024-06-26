# autenticação do provider "aws"
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration

# provider: argument reference
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs#argument-reference

# provider padrão
provider "aws" {
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key"
  # default_tags {
  #   tags = {
  #     environment = "dev"
  #   }
  # }
}

# provider com alias "west"
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
