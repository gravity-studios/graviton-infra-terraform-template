module "eks_main" {
  source           = "./graviton-eks"
  eks_cluster_name = var.eks_cluster_name
  vpc_name         = var.vpc_name
  region           = var.region
  instance_type    = var.instance_type
  num_workers      = var.num_workers
  map_users        = var.map_users
}
