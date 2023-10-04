data "mongodbatlas_advanced_cluster" "this" {
  project_id = var.atlas_project_id
  name       = var.cluster_name

  depends_on = [mongodbatlas_privatelink_endpoint_service.this]
}

locals {
  db_endpoint = lookup(data.mongodbatlas_advanced_cluster.this.connection_strings[0].aws_private_link_srv, aws_vpc_endpoint.this.id)
  db_protocol = split("://", local.db_endpoint)[0]
  db_port     = local.db_protocol == "mongodb+srv" ? 27016 : 27017
}

resource "aws_secretsmanager_secret" "db_admin_password" {
  name_prefix = "${local.block_name}/db_admin_password/"
  tags        = local.tags
  kms_key_id  = aws_kms_key.this.arn

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_secretsmanager_secret_version" "db_admin_password" {
  secret_id     = aws_secretsmanager_secret.db_admin_password.id
  secret_string = var.db_admin_password

  lifecycle {
    create_before_destroy = true
  }
}
