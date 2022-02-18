/*
 * Terraform Base Mod - ECR
 * Author: Andrei Marinescu
 */

resource "aws_ecr_repository" "ecr-dev" {
  name                 = "${var.ecr_name_prefix}-dev"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository_policy" "ecr-dev-policy" {
  repository = aws_ecr_repository.ecr-dev.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}

resource "aws_ecr_repository" "ecr-staging" {
  name                 = "${var.ecr_name_prefix}-staging"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository_policy" "ecr-staging-policy" {
  repository = aws_ecr_repository.ecr-staging.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}

resource "aws_ecr_repository" "ecr-prod" {
  name                 = "${var.ecr_name_prefix}-prod"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository_policy" "ecr-prod-policy" {
  repository = aws_ecr_repository.ecr-prod.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}
