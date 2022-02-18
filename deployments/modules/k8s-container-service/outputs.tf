/*
 * K8S Deployment Task Definition Module
 * Author: Andrei Marinescu
 */

output "lb_ip" {
  value = kubernetes_ingress.alb-ingress.status.0.load_balancer.0.ingress.0.hostname
  description = "FQDN of backend load balancer"
}
