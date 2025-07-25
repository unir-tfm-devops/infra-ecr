module "spring-boot-template" {
  source = "./modules/ecr"

  name = "spring-boot-template"
}

module "nodejs-template" {
  source = "./modules/ecr"

  name = "nodejs-template"
}

module "tooling-api" {
  source = "./modules/ecr"

  name = "tooling-api"
}