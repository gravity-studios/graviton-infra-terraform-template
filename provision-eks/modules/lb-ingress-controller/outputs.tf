/*
 * AWS EKS Amazon LB Controller Module
 * Author: Eduard Bulai, Andrei Marinescu
 */

output "ingress_namespace" {
  value = helm_release.lb_ingress.metadata[0].namespace
}
output "ingress_name" {
  value = helm_release.lb_ingress.metadata[0].name
}
