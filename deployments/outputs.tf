output "dev_lb_ip" {
  value = module.backend_dev.lb_ip
  description = "FQDN of dev backend load balancer"
}

output "staging_lb_ip" {
  value = module.backend_staging.lb_ip
  description = "FQDN of staging backend load balancer"
}

output "prod_lb_ip" {
  value = module.backend_prod.lb_ip
  description = "FQDN of production backend load balancer"
}
