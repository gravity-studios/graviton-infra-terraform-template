/*
 * K8S Deployment Task Definition Module
 * Author: Andrei Marinescu
 */

variable "eks_region" {
  type = string
}

variable "eks_cluster_id" {
  type = string
}

variable "app_name" {
  type = string
}

variable "kubernetes_namespace" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_port" {
  type = string
}

variable "acm_cert_arn" {
  type = string
}

variable "vpc_public_subnets" {
  type = list(string)
}



# ENV VARS

variable "env_var_1" {

}
variable "env_var_2" {

}
