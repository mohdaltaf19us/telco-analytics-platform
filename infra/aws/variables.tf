variable "env" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "aws_profile" {
  type    = string
  default = "telco-tf"
}

variable "alert_email" {
  type        = string
  description = "Email that receives pipeline alerts"
}
