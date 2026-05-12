# AWS EC2 Infrastructure with Terraform

This repository contains Terraform configurations to deploy EC2 instances on AWS. Follow the steps below to set up your environment and deploy the infrastructure.

---

## Prerequisites

### 1. Install & Configure AWS CLI
Before running Terraform, you must have the AWS CLI installed and authenticated on your local machine.

- **Installation:** [Follow the official AWS Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) for your OS.
- **Configuration:** Run the following command in your terminal:
  ```bash
  aws configure

```

You will be prompted for your:

* AWS Access Key ID
* AWS Secret Access Key
* Default region name (e.g., `us-east-1`)
* Default output format (e.g., `json`)

---

## Getting Started

### 2. Clone the Repository

```bash
git clone <your-repo-url>
cd <repo-name>

```

### 3. Generate SSH Keys

Terraform needs an SSH key pair to allow you to connect to the EC2 instances.

1. **Create the keys directory:**
```bash
mkdir keys
cd keys

```


2. **Generate the key pair:**
Run the following command and name the file `ec2_key` when prompted (or just hit enter if you specify the path in the command).
```bash
ssh-keygen -t rsa -b 4096 -f ec2_key

```


* This will create two files: `ec2_key` (Private Key) and `ec2_key.pub` (Public Key).
* **Note:** Ensure you stay in the root of the project for the next steps.



---

## Configuration

### 4. Update Variables

Navigate to the `variables.tf` file in the root directory. You will need to update the following variables to match your environment:

* `ami_id`: The ID of the AMI you want to use.
* `instance_type`: The size of the instance (e.g., `t2.micro`).
* `instance_count`: How many instances you want to launch.
* `ec2_private_key_path`: Update this to point to the key you just created (e.g., `./keys/ec2_key`).

```hcl
# Example change in variables.tf
variable "ec2_private_key_path" {
  default = "./keys/ec2_key"
}

```

---

## Deployment

1. **Initialize Terraform:**
```bash
terraform init

```


2. **Check the Plan:**
```bash
terraform plan

```


3. **Apply the Changes:**
```bash
terraform apply

```



---

## Important Security Note

The `keys/` folder contains your private credentials. **Never commit the `keys/` folder to Version Control (GitHub).** Ensure `keys/` is added to your `.gitignore` file.
"""