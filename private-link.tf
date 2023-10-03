data "mongodbatlas_privatelink_endpoint" "this" {
  project_id      = var.atlas_project_id
  private_link_id = var.atlas_private_link_id
  provider_name = "AWS"
}

resource "aws_vpc_endpoint" "this" {
  vpc_id             = local.vpc_id
  service_name       = data.mongodbatlas_privatelink_endpoint.this.endpoint_service_name
  vpc_endpoint_type  = "Interface"
  subnet_ids         = local.private_subnet_ids
  security_group_ids = [aws_security_group.this.id]
  tags               = merge(local.tags, { Name = local.resource_name })
}

resource "mongodbatlas_privatelink_endpoint_service" "this" {
  project_id          = var.atlas_project_id
  private_link_id     = var.atlas_private_link_id
  endpoint_service_id = aws_vpc_endpoint.this.id
  provider_name       = "AWS"
}
