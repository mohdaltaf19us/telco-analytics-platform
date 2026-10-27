# Workaround for the AWS "new experience" (project) account type:
# a managed RCP blocks principals outside the AWS organization (including
# Snowflake's AWS user), so a storage integration cannot assume a role here.
# Snowflake instead reads S3 with this in-account IAM user, limited to landing/.
# The access key is created by CLI (not Terraform) so the secret never lands in state.
resource "aws_iam_user" "snowflake_reader" {
  name = "${local.prefix}-user-snowflake-reader"
}

data "aws_iam_policy_document" "snowflake_read_landing" {
  statement {
    sid       = "ReadLanding"
    actions   = ["s3:GetObject", "s3:GetObjectVersion"]
    resources = ["${aws_s3_bucket.lake.arn}/landing/*"]
  }
  statement {
    sid       = "ListLanding"
    actions   = ["s3:ListBucket", "s3:GetBucketLocation"]
    resources = [aws_s3_bucket.lake.arn]
    condition {
      test     = "StringLike"
      variable = "s3:prefix"
      values   = ["landing/*", "landing/", ""]
    }
  }
}

resource "aws_iam_user_policy" "snowflake_read_landing" {
  name   = "read-landing-only"
  user   = aws_iam_user.snowflake_reader.name
  policy = data.aws_iam_policy_document.snowflake_read_landing.json
}
