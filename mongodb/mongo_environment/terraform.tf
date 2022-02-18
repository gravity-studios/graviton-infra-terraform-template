/*
 * MongoDB Atlas Provisioning Module
 * Author: Eduard Bulai, Andrei Marinescu
 */

terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.2.0"
    }
  }
}