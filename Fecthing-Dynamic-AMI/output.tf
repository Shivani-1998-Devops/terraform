output "ubuntu_ami_data" {
  value = data.aws_ami.ubuntu
}

output "caller_identity" {
  value = data.aws_caller_identity.current
}

output "default_vpc" {
  value = data.aws_vpc.default
}

output "default_subnets" {
  value = data.aws_subnets.default
}