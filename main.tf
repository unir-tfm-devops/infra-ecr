module "spring-boot-template" {
  source = "./modules/ecr"

  name = "spring-boot-template"
}

module "nodejs-template" {
  source = "./modules/ecr"

  name = "nodejs-template"
}

module "products-service" {
  source = "./modules/ecr"

  name = "products-service"
}