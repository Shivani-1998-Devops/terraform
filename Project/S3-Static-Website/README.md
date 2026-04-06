# S3 Static Website Terraform Project

A complete Terraform infrastructure-as-code solution to deploy a static website on AWS S3 with public access enabled.

## 📋 Project Overview

This project automates the creation and management of an AWS S3 bucket configured to host a static website. It includes:
- S3 bucket creation with random suffix for global uniqueness
- Public access configuration
- Bucket policy for public read access
- Website configuration (index and error documents)
- Automatic upload of HTML, CSS, and image files

## 🏗️ Project Structure

```
S3-Static-Website/
├── README.md                 # This file
├── terraform.tf              # Terraform version and backend configuration
├── provider.tf               # AWS provider settings
├── s3.tf                     # S3 bucket, policy, and object resources
├── output.tf                 # Output values (bucket name, website URL)
├── terraform.tfstate         # Terraform state file
└── build/                    # Website files to upload
    ├── index.html            # Homepage
    ├── error.html            # Error page
    ├── style.css             # Stylesheet
    ├── b1.jfif               # Image file
    ├── s1.jfif               # Image file
    ├── s3.jfif               # Image file
    └── s4.jfif               # Image file
```

## 📦 Prerequisites

Before running this project, ensure you have:

1. **Terraform** installed (v1.0+)
   ```bash
   terraform --version
   ```

2. **AWS CLI** installed and configured
   ```bash
   aws --version
   aws configure
   ```

3. **AWS Credentials** configured with appropriate permissions
   ```bash
   aws s3 ls
   ```

4. **Project files** in the `build/` directory

## 🚀 Getting Started

### 1. Initialize Terraform

```bash
terraform init
```

This command:
- Downloads required AWS provider plugins
- Sets up the `.terraform` working directory
- Initializes the local state file (if not using remote backend)

### 2. Plan the Deployment

```bash
terraform plan
```

Review the planned changes. This will show you:
- S3 bucket creation
- IAM policy creation
- Website configuration
- File uploads

### 3. Apply the Configuration

```bash
terraform apply
```

When prompted, type `yes` to confirm the deployment.

### 4. View Outputs

```bash
terraform output
```

This will display:
- S3 bucket name
- Website endpoint URL
- Bucket ARN

## 🌐 Access Your Website

After deployment, access your static website using one of these URLs:

### Website Endpoint
```
http://<bucket_name>.s3-website-<region>.amazonaws.com
```

Example:
```
http://my-static-website-c3e60ff8.s3-website-us-east-1.amazonaws.com
```

### S3 Standard URL
```
https://s3.<region>.amazonaws.com/<bucket_name>/index.html
```

### CloudFront Distribution (Optional)
For better performance, you can add a CloudFront distribution to cache the content globally.

## 📝 File Descriptions

### `terraform.tf`
Specifies Terraform version requirements and AWS provider configuration.

### `provider.tf`
AWS provider settings including default region.

### `s3.tf`
Contains all S3 resources:
- `aws_s3_bucket`: Main S3 bucket
- `aws_s3_bucket_public_access_block`: Public access settings
- `aws_s3_bucket_policy`: Bucket policy for public read access
- `aws_s3_bucket_website_configuration`: Website hosting configuration
- `aws_s3_object`: Individual file uploads (HTML, CSS, images)

### `output.tf`
Exports important values after deployment:
- Bucket name
- Website endpoint
- Bucket ARN
- Bucket region

### `build/`
Directory containing website files to upload:
- **index.html**: Main webpage
- **error.html**: Custom error page
- **style.css**: Website styling
- **Images**: JFIF format images (b1.jfif, s1.jfif, s3.jfif, s4.jfif)

## 🔧 Common Commands

### View Current State
```bash
terraform state list
terraform state show aws_s3_bucket.static_website
```

### View Outputs Again
```bash
terraform output bucket_name
terraform output website_endpoint
```

### Update Specific Files
Edit files in the `build/` directory, then run:
```bash
terraform apply
```

### Destroy All Resources
```bash
terraform destroy
```

When prompted, type `yes` to confirm deletion.

### Show Resource List
```bash
terraform state list
```

### Format Terraform Files
```bash
terraform fmt
```

### Validate Configuration
```bash
terraform validate
```

## 🔐 Security Considerations

- ⚠️ **Public Access Enabled**: This bucket is intentionally set for public read access via bucket policy
- 🔒 **Block ACLs**: ACLs are disabled on the bucket; access is controlled via bucket policy
- 📋 **Bucket Policy**: Only allows `s3:GetObject` action (read-only public access)

## 🐛 Troubleshooting

### Error: "AccessControlListNotSupported"
The `acl` parameter has been removed from S3 objects. Bucket policy handles permissions.

### Error: "The bucket does not allow ACLs"
This is normal with modern S3 configurations. The bucket policy provides necessary permissions.

### Files Not Uploading
Ensure all files in `build/` directory exist and verify file paths in `s3.tf`.

### SSL Certificate Error When Accessing Website
Use `http://` (not https) when accessing the S3 website endpoint directly:
```bash
http://my-static-website-c3e60ff8.s3-website-us-east-1.amazonaws.com
```

## 📊 Useful AWS CLI Commands

### List Bucket Contents
```bash
aws s3 ls s3://<bucket_name>
```

### View Specific File
```bash
aws s3api head-object --bucket <bucket_name> --key index.html
```

### Download File from Bucket
```bash
aws s3 cp s3://<bucket_name>/index.html ./index.html
```

### View Bucket Policy
```bash
aws s3api get-bucket-policy --bucket <bucket_name>
```

### Check Bucket Versioning
```bash
aws s3api get-bucket-versioning --bucket <bucket_name>
```

### Enable Bucket Logging
```bash
aws s3api put-bucket-logging --bucket <bucket_name> --bucket-logging-status file://logging.json
```

## 🔄 CI/CD Integration

To integrate with CI/CD pipelines:

```bash
# GitHub Actions example
- name: Terraform Init
  run: terraform init

- name: Terraform Plan
  run: terraform plan -out=tfplan

- name: Terraform Apply
  run: terraform apply tfplan
```

## 📚 Additional Resources

- [Terraform AWS S3 Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [Terraform Official Documentation](https://www.terraform.io/docs)

## 📝 Notes

- The bucket name includes a random 8-character hex suffix for global uniqueness
- Website files are automatically synced to S3 when `terraform apply` is run
- Changes to files in `build/` directory require updating the `etag` values or running `terraform apply` again
- All resources are tagged with project information in the Terraform code

## 🎯 Next Steps

1. Customize `build/index.html` and `build/error.html` with your content
2. Add your own images to the `build/` directory
3. Update `style.css` for your website design
4. Run `terraform apply` to deploy
5. Access your website using the endpoint URL

## 💡 Tips

- Use `terraform plan` before `terraform apply` to review changes
- Keep your `terraform.tfstate` file safe (consider remote backend)
- Regularly run `terraform validate` to catch configuration errors early
- Use `terraform fmt` to keep code formatting consistent

---

**Last Updated**: April 6, 2026  
**Terraform Version**: v1.0+  
**AWS Provider**: Latest
