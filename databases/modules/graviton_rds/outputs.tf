output "rds_hostname" {
  value = aws_db_instance.graviton_rds.address
}
output "rds_arn" {
  value = aws_db_instance.graviton_rds.arn
}
output "rds_username" {
  value = aws_db_instance.graviton_rds.username
}
