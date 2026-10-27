# Only the containers. Values are added by CLI in Phase 2, never in Terraform or Git.
resource "aws_secretsmanager_secret" "snowflake" {
  for_each                = toset(["svc_airflow", "svc_dbt"])
  name                    = "telco/${var.env}/snowflake/${each.value}"
  recovery_window_in_days = 0 # lets you destroy and recreate cleanly while practising
}
