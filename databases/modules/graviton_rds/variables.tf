variable "name" {
  description = "The name of the RDS instance"
  type        = string
}
variable "vpc_public_subnets" {
  type        = list(string)
  description = "The public subnets to use for the RDS instance"
  default     = []
}
variable "whitelist_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks to allow traffic from"
  default     = ["10.0.0.0/16"]
}
variable "vpc_id" {
  type        = string
  description = "The VPC ID to use for the RDS instance"
  default     = ""
}
variable "instance_class" {
  type        = string
  description = "The instance class to use for the RDS instance"
  default     = "db.t3.micro"
}
variable "db_password" {
  description = "The main user password for the RDS instance"
  type        = string
}
variable "db_username" {
  description = "The main user username for the RDS instance"
  type        = string
}
variable "db_name" {
  description = "The database name that should be created"
  type        = string
}
