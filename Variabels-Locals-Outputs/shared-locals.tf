# Local values for project metadata
# These locals define common project information used across resources
locals {
  project       = "08-input-vars-locals-outputs"
  project_owner = "terraform-aws-modules"
  cost_center   = "1234"
  managed_by    = "Terraform"
}

# Local values for common tags
# Merges project metadata with additional tags for consistent tagging
locals {
  common_tags = {
    project       = local.project
    project_owner = local.project_owner
    cost_center   = local.cost_center
    managed_by    = local.managed_by
    sensitive_tag = var.my_sensitive_value
  }
}