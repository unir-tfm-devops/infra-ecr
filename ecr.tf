resource "aws_ecr_repository" "products_service" {
  name                 = "products-service"
  image_tag_mutability = "MUTABLE"
  scan_on_push        = true
}