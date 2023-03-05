resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.vpc_public_subnets

  tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_security_group" "rds" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.whitelist_cidr_blocks
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.whitelist_cidr_blocks
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_db_parameter_group" "rds_param_group" {
  name   = "${var.name}-param-group"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "graviton_rds" {
  identifier              = var.name
  instance_class          = var.instance_class
  allocated_storage       = 5
  engine                  = "postgres"
  engine_version          = "13.4"
  username                = var.db_username
  password                = var.db_password
  name                    = var.db_name
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds.id]
  parameter_group_name    = aws_db_parameter_group.rds_param_group.name
  backup_retention_period = 14
  publicly_accessible     = false
  skip_final_snapshot     = true
  apply_immediately       = true
  tags = {
    ManagedBy = "Terraform"
  }
}
