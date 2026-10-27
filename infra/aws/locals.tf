locals {
  prefix = "telco-${var.env}-use2"
  tags = {
    project    = "telco"
    env        = var.env
    owner      = "altaf"
    managed_by = "terraform"
  }
}
