data "mongodbatlas_advanced_cluster" "this" {
  project_id = var.atlas_project_id
  name       = var.cluster_name
}

locals {
  db_endpoint       = lookup(data.mongodbatlas_advanced_cluster.this.connection_strings[0].aws_private_link_srv, aws_vpc_endpoint.this.id)
  db_protocol       = split("://", local.db_endpoint)[0]
  db_port           = local.db_protocol == "mongodb+srv" ? 27016 : 27017
}
