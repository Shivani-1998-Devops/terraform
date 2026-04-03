# 🚀 Terraform + AWS CLI + Git Setup (Windows)

This guide helps you install and use:

* Terraform CLI
* AWS CLI
* Git & GitHub
* Basic Terraform workflow

---

## 🖥️ 1. Install Terraform (Windows)

### 🔽 Download Terraform

* Visit: https://developer.hashicorp.com/terraform/downloads

### ⚙️ Install Steps

1. Download Windows AMD64 zip
2. Extract the zip
3. Move `terraform.exe` to a folder (e.g., `C:\terraform`)
4. Add this folder to **Environment Variables → PATH**

---

### ✅ Verify Installation

```bash id="tfv1"
terraform -version
```

---

## ☁️ 2. Install AWS CLI

### 🔽 Download

* Visit: https://aws.amazon.com/cli/

### ⚙️ Install

* Download MSI installer and install

---

### ✅ Verify

```bash id="tfv2"
aws --version
```

---

## 🔐 3. Configure AWS Credentials

```bash id="tfv3"
aws configure
```

Provide:

* AWS Access Key
* AWS Secret Key
* Region → ap-south-1
* Output → json

---

## 📦 4. Install Git

### 🔽 Download

* https://git-scm.com/download/win

---

### ✅ Verify

```bash id="tfv4"
git --version
```

---

## 📁 5. Initialize Git Repository

```bash id="tfv5"
git init
git branch -M main
```

---

## 🔗 6. Connect to GitHub

```bash id="tfv6"
git remote add origin https://github.com/<your-username>/<repo-name>.git
```

---

## 📤 7. Push Code to GitHub

```bash id="tfv7"
git add .
git commit -m "Initial commit"
git push -u origin main
```

---

## 🏗️ 8. Terraform Workflow

### 📌 Initialize Project

```bash id="tfv8"
terraform init
```

---

### 📌 Validate Configuration

```bash id="tfv9"
terraform validate
```

---

### 📌 Format Code

```bash id="tfv10"
terraform fmt
```

---

### 📌 Show Execution Plan

```bash id="tfv11"
terraform plan
```

Save plan:

```bash id="tfv12"
terraform plan -out=myPlan.tfplan
```

---

### 📌 Apply Changes

```bash id="tfv13"
terraform apply
```

Using saved plan:

```bash id="tfv14"
terraform apply myPlan.tfplan
```

Auto approve:

```bash id="tfv15"
terraform apply -auto-approve
```

---

### 📌 Destroy Infrastructure

```bash id="tfv16"
terraform destroy
```

---

## 📊 9. Terraform State Commands

```bash id="tfv17"
terraform show
terraform state list
terraform state show <resource>
```

---

## 🔄 10. Workspace Commands

```bash id="tfv18"
terraform workspace list
terraform workspace new dev
terraform workspace select dev
```

---

## 🔍 11. Output & Variables

```bash id="tfv19"
terraform output
terraform console
```

---

## 🧹 12. Cleanup Files

```bash id="tfv20"
rm -rf .terraform
rm *.tfplan
```

---

## 🚫 13. .gitignore (Important)

```bash id="tfv21"
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
*.tfvars
.env
```

---

## ❗ Troubleshooting

### ⏰ Signature Expired Error

```bash id="tfv22"
w32tm /resync
```

---

### 🔑 AWS Credentials Issue

```bash id="tfv23"
aws sts get-caller-identity
```

---

## 💡 Best Practices

* Use **remote backend (S3 + DynamoDB)**
* Never commit `.tfstate` or `.tfvars`
* Use IAM roles instead of static keys
* Enable versioning & encryption in S3

---

## 🧠 Useful Commands Summary

```bash id="tfv24"
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## 👩‍💻 Author

Shivani Burgahte
