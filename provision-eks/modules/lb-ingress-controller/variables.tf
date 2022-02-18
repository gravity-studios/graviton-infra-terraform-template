/*
 * AWS EKS Amazon LB Controller Module
 * Author: Eduard Bulai, Andrei Marinescu
 */

variable "lb_ingress_controller_helm_app" {
  type        = any
  description = "Helm chart definition for lb_ingress_controller."
  default     = {}
}
variable "eks_cluster_id" {
  type        = string
  description = "EKS cluster Id"
}
variable "eks_oidc_issuer_url" {
  type        = string
  description = "The URL on the EKS cluster OIDC Issuer"
}

variable "eks_oidc_provider_arn" {
  type        = string
  description = "The ARN of the OIDC Provider if `enable_irsa = true`."

}
