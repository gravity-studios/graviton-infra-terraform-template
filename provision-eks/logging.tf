module "fluent_logging" {
  source         = "./modules/aws-for-fluentbit"
  eks_cluster_id = module.eks.cluster_id
  tags           = { "managed-by" : "tf-aws-fluentbit" }
}
