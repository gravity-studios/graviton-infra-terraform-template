/*
 * # K8S Deployment Task Definition Module
 * ##### Author: Andrei Marinescu
 */

provider "aws" {
  region = var.eks_region
}

data "aws_eks_cluster" "cluster" {
  name = var.eks_cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.cluster.name
    ]
  }
}

resource "kubernetes_namespace_v1" "env_namespace" {
  count = 1
  metadata {
    name = var.kubernetes_namespace

    labels = {
      "app.kubernetes.io/managed-by" = "terraform-ssp-amazon-eks"
    }
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = var.app_name
    namespace = var.kubernetes_namespace
    labels = {
      App = var.app_name
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = var.app_name
      }
    }
    template {
      metadata {
        labels = {
          App = var.app_name
        }
      }
      spec {
        container {
          image             = var.container_image
          name              = var.app_name
          image_pull_policy = "Always"

          port {
            container_port = var.container_port
          }

          env {
            name  = "ENV_VAR_1"
            value = var.env_var_1
          }
          env {
            name  = "ENV_VAR_2"
            value = var.env_var_2
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name      = var.app_name
    namespace = var.kubernetes_namespace
  }
  spec {
    type = "NodePort"
    selector = {
      App = kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.App
    }
    port {
      name        = "http"
      port        = 80
      target_port = var.container_port
    }
  }
}

resource "kubernetes_ingress_v1" "alb-ingress" {
  metadata {
    name      = "lb-${var.app_name}"
    namespace = var.kubernetes_namespace
    #    namespace = kubernetes_namespace.echoserver.metadata[0].name
    annotations = {
#      "kubernetes.io/ingress.class" : "alb"
      "alb.ingress.kubernetes.io/scheme" : "internet-facing"
      "alb.ingress.kubernetes.io/subnets" : join(",", var.vpc_public_subnets)
      "alb.ingress.kubernetes.io/listen-ports" : "[{\"HTTPS\":443}, {\"HTTP\":80}]"
      "alb.ingress.kubernetes.io/certificate-arn" : var.acm_cert_arn
      "alb.ingress.kubernetes.io/actions.ssl-redirect" : "{\"Type\": \"redirect\", \"RedirectConfig\": { \"Protocol\": \"HTTPS\", \"Port\": \"443\", \"StatusCode\": \"HTTP_301\"}}"

      #      "alb.ingress.kubernetes.io/tags": "Environment=dev,Team=test"
    }
  }
  spec {
    ingress_class_name = "alb"
    rule {
      http {
        path {
          path = "/"
          backend {
            service {
              name = "ssl-redirect"
              port { name = "use-annotation"}
            }
#            service_name = "ssl-redirect"
#            service_port = "use-annotation"
          }
        }
        path {
          path = "/"
          backend {
            service {
              name = var.app_name
              port { number = "80"}
            }
#            service_name = var.app_name
#            service_port = "80"
          }
        }
      }
    }
  }
}
