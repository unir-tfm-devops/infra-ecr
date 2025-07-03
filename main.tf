module "spring-boot-template" {
  source = "./modules/ecr"

  name = "spring-boot-template"
}

module "products-service" {
  source = "./modules/ecr"

  name = "products-service"
}
