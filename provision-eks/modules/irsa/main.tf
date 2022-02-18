/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: MIT-0
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this
 * software and associated documentation files (the "Software"), to deal in the Software
 * without restriction, including without limitation the rights to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

resource "kubernetes_namespace_v1" "irsa" {
  count = var.create_kubernetes_namespace ? 1 : 0
  metadata {
    name = var.kubernetes_namespace

    labels = {
      "app.kubernetes.io/managed-by" = "terraform-ssp-amazon-eks"
    }
  }
}

resource "kubernetes_service_account_v1" "irsa" {
  count = var.create_kubernetes_service_account ? 1 : 0
  metadata {
    name        = var.kubernetes_service_account
    namespace   = var.kubernetes_namespace
    annotations = { "eks.amazonaws.com/role-arn" : aws_iam_role.irsa.arn }
    labels = {
      "app.kubernetes.io/managed-by" = "terraform-ssp-amazon-eks"
    }
  }

  automount_service_account_token = true
}

resource "aws_iam_role" "irsa" {
  name                  = "${var.eks_cluster_id}-${var.kubernetes_service_account}-irsa"
  assume_role_policy    = join("", data.aws_iam_policy_document.irsa_with_oidc.*.json)
  path                  = var.iam_role_path
  force_detach_policies = true
  tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "irsa" {
  count      = length(var.irsa_iam_policies)
  policy_arn = var.irsa_iam_policies[count.index]
  role       = aws_iam_role.irsa.name
}
