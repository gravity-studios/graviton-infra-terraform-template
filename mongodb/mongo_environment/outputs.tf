/*
 * MongoDB Atlas Provisioning Module
 * Author: Eduard Bulai, Andrei Marinescu
 */

output "mongodb_host" {
  value = mongodbatlas_cluster.api_cluster.connection_strings.0.standard_srv
}

output "mongodb_user" {
  value = mongodbatlas_database_user.api_cluster_user.username
}

output "mongodb_password" {
  value = mongodbatlas_database_user.api_cluster_user.password
}
