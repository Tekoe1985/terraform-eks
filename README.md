# Amazon EKS Cluster Provisioning using Terraform

This repository provisions an **Amazon EKS (Elastic Kubernetes Service) cluster** using **Terraform**.
It follows Infrastructure as Code (IaC) best practices to create a scalable, secure, and reproducible Kubernetes environment on AWS.

---

## 🧱 Architecture Overview

The Terraform configuration creates:

* VPC with public and private subnets
* Internet Gateway and NAT Gateway
* Amazon EKS Cluster
* EKS Managed Node Group
* IAM Roles and Policies for EKS and worker nodes
* Security Groups

---

## 📂 Project Structure

```bash
.
├── main.tf            # Main Terraform configuration
├── variables.tf       # Input variables
├── outputs.tf         # Output values
├── providers.tf       # AWS and Kubernetes providers
├── versions.tf        # Terraform and provider versions
├── terraform.tfvars   # Variable values (not committed)
└── README.md
```

---

## ⚙️ Prerequisites

Before you begin, ensure you have:

* AWS Account
* AWS CLI configured (`aws configure`)
* Terraform v1.3+
* kubectl
* IAM permissions to create EKS, VPC, and IAM resources

---

## 🔐 AWS Authentication

Terraform uses AWS credentials from:

* `~/.aws/credentials`, or
* Environment variables:

  ```bash
  export AWS_ACCESS_KEY_ID=xxxx
  export AWS_SECRET_ACCESS_KEY=xxxx
  export AWS_DEFAULT_REGION=us-east-1
  ```

---

## 🚀 Usage

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Validate Configuration

```bash
terraform validate
```

### 3️⃣ Review the Execution Plan

```bash
terraform plan
```

### 4️⃣ Create the EKS Cluster

```bash
terraform apply
```

Type `yes` when prompted.

---

## 🔗 Configure kubectl Access

After deployment, update kubeconfig:

```bash
aws eks update-kubeconfig \
  --region us-east-1 \
  --name eks-cluster-name
```

Verify:

```bash
kubectl get nodes
```

---

## 📤 Outputs

After successful deployment, Terraform outputs:

* EKS Cluster Name
* Cluster Endpoint
* Node Group ARN

---

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## 🛡️ Best Practices Followed

* Private subnets for worker nodes
* IAM roles with least privilege
* Managed node groups for easier upgrades
* Terraform state management support

---

## 📌 Notes

* Do not commit `terraform.tfvars`
* Use remote backend (S3 + DynamoDB) for production
* Review AWS costs before applying

🧠 Golden rule (remember this forever)

If you create resources using a module, you must consume them using module.<name>.<output>

---

## 👤 Author

Created by **[Your Name]**
DevOps Engineer
