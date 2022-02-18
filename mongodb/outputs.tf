output "dev_mongo_host" {
  value = module.mongodb_dev.mongodb_host
  description = "Hostname of dev mongoDB cluster"
}

output "dev_mongo_user" {
  value = module.mongodb_dev.mongodb_user
  description = "DB username of dev mongoDB cluster"
}

output "dev_mongo_pass" {
  value = module.mongodb_dev.mongodb_password
  description = "DB password of dev mongoDB cluster"
}
