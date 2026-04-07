# Fetching Dynamic AMI

This Terraform project demonstrates how to dynamically fetch the latest Ubuntu 22.04 AMI from AWS and provision an EC2 instance using that AMI.

## Overview

The project consists of the following components:
- `ami.tf`: Defines a data source to fetch the most recent Ubuntu 22.04 AMI
- `ec2.tf`: Creates an AWS EC2 instance using the fetched AMI
- `output.tf`: Outputs the AMI data for reference
- `provider.tf`: Configures the AWS provider
- `terraform.tf`: Specifies Terraform and provider version requirements

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version ~> 1.7)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- AWS account with permissions to create EC2 instances

## Usage

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd Fecthing-Dynamic-AMI
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the execution plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. When done, destroy the resources:
   ```bash
   terraform destroy
   ```

## Configuration

The project is configured to:
- Use the `ap-south-1` (Mumbai) region
- Fetch the latest Ubuntu 22.04 LTS AMI
- Create a `t3.micro` instance with 8GB GP2 root volume
- Associate a public IP address

## Outputs

- `ubuntu_ami_data`: Details of the fetched Ubuntu AMI

## Notes

- The AMI filter is set to fetch Ubuntu 22.04 server images
- The instance will be created with default security group (ensure proper security configurations in production)
- Costs may apply for running EC2 instances in AWS