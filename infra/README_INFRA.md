# infra/ — how to apply (AWS project account, us-east-2)

1. `aws login --profile telco-dev` (choose the Dream It Ship It project)
2. `cd infra/bootstrap && terraform init && terraform apply`   (once, creates the state bucket)
3. `cd ../aws && terraform init && terraform apply -var-file=../envs/dev.tfvars`
4. Confirm the SNS subscription email.
5. `aws iam create-access-key --user-name telco-dev-use2-user-snowflake-reader`
   → paste the key straight into the Snowflake stage SQL. Never commit it.

Account-type constraints (AWS "new experience"): external principals are blocked by a
managed RCP, so Snowflake uses an in-account read-only IAM user instead of a storage
integration role; Kinesis/Firehose need the paid plan; MWAA only as serverless.
