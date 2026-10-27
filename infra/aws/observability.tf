resource "aws_sns_topic" "alerts" {
  name = "${local.prefix}-sns-alerts-01"
}

resource "aws_sns_topic_subscription" "alerts_email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

resource "aws_cloudwatch_log_group" "airflow" {
  name              = "/telco/${var.env}/airflow"
  retention_in_days = 14
}
