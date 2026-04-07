# Variable for EC2 instance type configuration
# This variable defines the instance type for EC2 instances
# Only t2.micro and t3.micro are allowed for cost optimization
variable "ec2_instance_type" {
  type        = string
  description = "The type of the managed EC2 instances."

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micro and t3.micro"
  }
}

# Variable for EC2 volume configuration
# Defines the root block device size and type
variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  description = "The size and type of the root block volume for EC2 instances."

  default = {
    size = 10
    type = "gp3"
  }
}

# Variable for additional tags
# Allows adding custom tags to resources
variable "additional_tags" {
  type    = map(string)
  default = {}
}

# Sensitive variable for demonstration
# This value should be treated as sensitive and not logged
variable "my_sensitive_value" {
  type      = string
  sensitive = true
}