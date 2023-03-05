/*
 * MongoDB Atlas Provisioning Module
 * Author: Eduard Bulai, Andrei Marinescu
 */

variable "environment" {
  type = string
}

variable "atlas_organization_id" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "aws_security_group_id" {
  type = string
}

variable "mongo_region_name" {
  type    = string
  default = "US_EAST_1"
}

variable "mongo_cluster_tier" {
  type = string
}

variable "mongo_master_user" {
  type = string
}

variable "private_route_table_id" {
  type = string
}

variable "public_route_table_id" {
  type = string
}
