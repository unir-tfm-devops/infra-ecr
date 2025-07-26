module "platform-ai" {
  source = "./modules/ecr"

  name = "platform-ai"
}

module "spring-boot-template" {
  source = "./modules/ecr"

  name = "spring-boot-template"
}

module "nodejs-template" {
  source = "./modules/ecr"

  name = "nodejs-template"
}