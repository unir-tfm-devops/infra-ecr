module "tooling-service" {
  source = "./modules/ecr"

  name = "tooling-service"
}

module "spring-boot-template" {
  source = "./modules/ecr"

  name = "spring-boot-template"
}

module "nodejs-template" {
  source = "./modules/ecr"

  name = "nodejs-template"
}