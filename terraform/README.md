# AWS EC2 Infrastructure with Terraform

This repository contains Terraform configurations to provision AWS EC2 infrastructure using reusable Terraform modules and a remote backend powered by Amazon S3 and DynamoDB.

---

# Project Structure

```bash
.
├── README.md
├── main.tf
├── modules
│   ├── ec2.tf
│   ├── outputs.tf
│   └── variables.tf
├── providers.tf
└── remote_infra
    ├── dynamodb.tf
    ├── providers.tf
    └── s3.tf
```

---

# Features

* Modular Terraform architecture
* Remote Terraform state management using S3
* State locking using DynamoDB
* Reusable EC2 infrastructure module
* Easy multi-environment deployments

---

# Prerequisites

## 1. Install Terraform

Install Terraform from the official website:

[Terraform Downloads](https://developer.hashicorp.com/terraform/downloads?utm_source=chatgpt.com)

Verify installation:

```bash
terraform -version
```

---

## 2. Install & Configure AWS CLI

Install AWS CLI:

[AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html?utm_source=chatgpt.com)

Configure AWS credentials:

```bash
aws configure
```

Provide:

* AWS Access Key ID
* AWS Secret Access Key
* Default region
* Output format (`json` recommended)

---

# Getting Started

## 1. Clone the Repository

```bash
git clone <your-repo-url>
cd <repo-name>
```

---

# Generate SSH Keys

Terraform uses SSH keys for EC2 access.

## Create Keys Directory

```bash
mkdir keys
cd keys
```

## Generate SSH Key Pair

```bash
ssh-keygen -t rsa -b 4096 -f ec2_key
```

This creates:

* `ec2_key` → Private Key
* `ec2_key.pub` → Public Key

Return to the root directory afterward:

```bash
cd ..
```

---

# Step 1: Create Remote Backend Infrastructure

Before deploying EC2 infrastructure, you must first create the remote backend resources.

The `remote_infra/` folder provisions:

* S3 bucket for Terraform state storage
* DynamoDB table for Terraform state locking

---

## Navigate to Remote Backend Folder

```bash
cd remote_infra
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Review the Plan

```bash
terraform plan
```

---

## Apply the Infrastructure

```bash
terraform apply
```

After successful deployment, Terraform will create:

* S3 Bucket
* DynamoDB Table

These resources will be used by the main Terraform configuration as the remote backend.

---

# Step 2: Configure Remote Backend

Now return to the root directory:

```bash
cd ..
```

Update your `providers.tf` file with the generated backend resources.

Example:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
```

Replace:

* `bucket`
* `dynamodb_table`

with your actual resource names.

---

# Step 3: Configure Infrastructure Variables

Update your Terraform variables inside `main.tf` or `terraform.tfvars`.

Important values:

* `ami_id`
* `instance_type`
* `instance_count`
* `ec2_private_key_path`

Example:

```hcl
module "dev_env" {
  source = "./modules"

  env                  = "dev"
  ami_id               = "ami-xxxxxxxx"
  instance_type        = "t3.micro"
  instance_count       = 1
  ec2_private_key_path = "./keys/ec2_key"
}
```

---

# Step 4: Deploy EC2 Infrastructure

## Initialize Terraform

```bash
terraform init -reconfigure
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Review Infrastructure Plan

```bash
terraform plan
```

---

## Apply Infrastructure

```bash
terraform apply
```

Terraform will provision your EC2 infrastructure using reusable modules.

---

# Terraform Modules

The `modules/` directory contains reusable Terraform code for EC2 provisioning.

Current module components:

| File           | Purpose           |
| -------------- | ----------------- |
| `ec2.tf`       | EC2 resources     |
| `variables.tf` | Input variables   |
| `outputs.tf`   | Terraform outputs |

---

# Destroy Infrastructure

## Destroy EC2 Infrastructure

From the root directory:

```bash
terraform destroy
```

---

## Destroy Remote Backend Infrastructure

Navigate to:

```bash
cd remote_infra
```

Then run:

```bash
terraform destroy
```

---

# Security Best Practices

## Never Commit Sensitive Files

Add the following to `.gitignore`:

```gitignore
.keys/
*.tfstate
*.tfstate.backup
.terraform/
.terraform.lock.hcl
```

---

# Notes

* Remote backend infrastructure must be created before the main infrastructure.
* Do not delete the S3 bucket or DynamoDB table while Terraform state is still in use.
* Always use remote state for team collaboration and state consistency.