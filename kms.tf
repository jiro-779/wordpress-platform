data "aws_caller_identity" "current" {}

resource "aws_kms_key" "wordpress" {
  description             = "KMS key for ${var.environment} WordPress resources"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "EnableRootPermissions"
        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }

        Action   = "kms:*"
        Resource = "*"
      },

      {
        Sid    = "AllowAutoScalingUseOfKey"
        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }

        Action = [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]

        Resource = "*"
      },

      {
        Sid    = "AllowAutoScalingCreateGrant"
        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
        }

        Action = [
          "kms:CreateGrant"
        ]

        Resource = "*"

        Condition = {
          Bool = {
            "kms:GrantIsForAWSResource" = "true"
          }
        }
      }
    ]
  })

  tags = {
    Name        = "${var.environment}-wp-kms"
    Environment = var.environment
    Project     = "wordpress"
  }
}

resource "aws_kms_alias" "wordpress" {
  name          = "alias/${var.environment}-wp-kms"
  target_key_id = aws_kms_key.wordpress.key_id
}