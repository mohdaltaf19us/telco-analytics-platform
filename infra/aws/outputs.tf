output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "lake_bucket" {
  value = aws_s3_bucket.lake.bucket
}

output "snowflake_reader_user" {
  value = aws_iam_user.snowflake_reader.name
}

output "alerts_topic_arn" {
  value = aws_sns_topic.alerts.arn
}
