# 🪣 Terraform AWS S3 Bucket (Random Name)

This project creates an AWS S3 bucket with a **unique random suffix** using Terraform.

---

## 📁 Project Structure

```id="q1w2e3"
.
├── main.tf          # S3 bucket + random ID resource
├── provider.tf      # AWS provider configuration
├── outputs.tf       # Output values
├── .gitignore       # Ignore sensitive files
```

---

## ⚙️ Prerequisites

Make sure the following tools are installed:

* Terraform >= 1.7
* AWS CLI
* AWS Account with proper IAM permissions

---

## 🔐 Configure AWS Credentials

### Option 1: AWS CLI

```bash id="a1b2c3"
aws configure
```

---

### Option 2: Environment Variables

```bash id="d4e5f6"
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="ap-south-1"
```

---

## 🚀 Terraform Workflow

### 1. Initialize Terraform

```bash id="g7h8i9"
terraform init
```

---

### 2. Validate Configuration

```bash id="j1k2l3"
terraform validate
```

---

### 3. Preview Execution Plan

```bash id="m4n5o6"
terraform plan
```

---

### 4. Apply Configuration

```bash id="p7q8r9"
terraform apply
```

Auto approve:

```bash id="s1t2u3"
terraform apply -auto-approve
```

---

### 5. Destroy Resources

```bash id="v4w5x6"
terraform destroy
```

---

## 🧩 Terraform Configuration Used

```hcl id="y7z8a9"
terraform {
  required_version = "~> 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "buket_suffix" {
  byte_length = 6
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-${random_id.buket_suffix.hex}"
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
}
```

---

## 📤 Output

After successful execution, Terraform will output:

```bash id="b1c2d3"
bucket_name = example-bucket-<random-hex>
```

---

## 🔍 Verify Bucket Creation

```bash id="e4f5g6"
aws s3 ls
```

---

## 🔒 Best Practices

* Do NOT commit:

  * `.tfstate` files
  * `.tfvars` files
* Use **remote backend (S3 + DynamoDB)** for production
* Enable:

  * Versioning
  * Server-side encryption
* Use IAM roles instead of static credentials

---

## ❗ Troubleshooting

### Signature Expired Error

```bash id="h7i8j9"
w32tm /resync
```

---

## 📌 Notes

* Bucket name is **globally unique** due to random suffix
* Region: `ap-south-1`
* Ensure IAM user has S3 permissions

---

## 👩‍💻 Author

Your Name
