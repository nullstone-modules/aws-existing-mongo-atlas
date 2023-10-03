variable "atlas_public_key_secret_id" {
  type        = string
  description = "The public key used to authenticate to your MongoDB Atlas account"
}

variable "atlas_private_key_secret_id" {
  type        = string
  description = "The private key used to authenticate to your MongoDB Atlas account"
}

variable "atlas_project_id" {
  type        = string
  description = "The ID of the Atlas project where the cluster is located"
}

variable "atlas_private_link_id" {
  type        = string
  description = "The id of the private link to connect to the cluster"
}

variable "cluster_name" {
  type        = string
  description = "The name of the Atlas cluster"
}

variable "db_admin_secret_id" {
  type        = string
  description = "The ID of the secret containing the database admin password"
}
