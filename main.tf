module "spring-boot-template" {
  source = "./modules/ecr"

  name = "spring-boot-template"
}

module "products-search-api" {
  source = "./modules/ecr"

  name = "products-search-api"
}
