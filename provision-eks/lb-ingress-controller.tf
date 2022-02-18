module "lb_ingress_controller" {
  count                 = 1
  source                = "./modules/lb-ingress-controller"
  eks_cluster_id        = module.eks.cluster_id
  eks_oidc_issuer_url   = module.eks.cluster_oidc_issuer_url
  eks_oidc_provider_arn = module.eks.oidc_provider_arn

  depends_on = [module.eks]
}
