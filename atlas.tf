provider "mongodbatlas" {
  public_key  = data.aws_secretsmanager_secret_version.atlas_public_key.secret_string
  private_key = data.aws_secretsmanager_secret_version.atlas_private_key.secret_string
}

data "aws_secretsmanager_secret_version" "atlas_public_key" {
  secret_id = var.atlas_public_key_secret_id
}
data "aws_secretsmanager_secret_version" "atlas_private_key" {
  secret_id = var.atlas_private_key_secret_id
}
