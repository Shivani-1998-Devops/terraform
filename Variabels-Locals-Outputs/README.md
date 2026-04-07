# Terraform AWS Project: Variables, Locals, and Outputs

This Terraform project demonstrates the use of variables, locals, and outputs in AWS infrastructure provisioning. It creates an S3 bucket with a random suffix and showcases best practices for Terraform configuration.

## Features

- **Variables**: Configurable EC2 instance types and volume configurations
- **Locals**: Common tags and project metadata
- **Outputs**: Sensitive outputs for S3 bucket name and variables
- **S3 Bucket**: Creates a uniquely named S3 bucket using random suffix

## Prerequisites

- Terraform >= 1.7
- AWS CLI configured with appropriate credentials
- AWS account with necessary permissions

## Usage

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd Variabels-Locals-Outputs
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Review the plan**:
   ```bash
   terraform plan
   ```

4. **Apply the configuration**:
   ```bash
   terraform apply
   ```

5. **Destroy resources** (when done):
   ```bash
   terraform destroy
   ```

## Configuration

### Variables

- `ec2_instance_type`: Type of EC2 instance (t2.micro or t3.micro)
- `ec2_volume_config`: Object with size and type for root volume
- `additional_tags`: Map of additional tags to apply
- `my_sensitive_value`: Sensitive string value

### Locals

- `project`: Project name
- `project_owner`: Owner of the project
- `cost_center`: Cost center identifier
- `managed_by`: Management tool
- `common_tags`: Merged tags applied to resources

### Outputs

- `s3_bucket_name`: Name of the created S3 bucket (sensitive)
- `sensitive_var`: The sensitive variable value

## File Structure

- `provider.tf`: Terraform and AWS provider configuration
- `variables.tf`: Input variable definitions
- `shared-locals.tf`: Local value definitions
- `s3.tf`: S3 bucket resource
- `compute.tf`: EC2 instance resource (commented out)
- `outputs.tf`: Output definitions
- `terraform.tfvars`: Default variable values
- `override.tfvars`: Override variable values

## Security Notes

- Sensitive values are marked appropriately
- Outputs containing sensitive information are flagged
- Use `.gitignore` to avoid committing sensitive files

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the MIT License.