# 🚀 Strapi Deployment on AWS ECS (Fargate) with Blue/Green Deployment

## 📌 Project Overview

This project demonstrates how to deploy a **Strapi application** on AWS using:

* **ECS Fargate**
* **Application Load Balancer (ALB)**
* **Blue/Green Deployment with CodeDeploy**
* **CI/CD using GitHub Actions**
* **Docker & Amazon ECR**

---

## 🧱 Architecture

* ECS Cluster with Fargate launch type
* ALB with **Blue & Green Target Groups**
* CodeDeploy for traffic shifting
* S3 bucket for AppSpec file
* GitHub Actions for CI/CD pipeline

---

## ⚙️ Technologies Used

* AWS ECS (Fargate)
* AWS ALB
* AWS CodeDeploy
* AWS ECR
* AWS S3
* Terraform (Infrastructure as Code)
* GitHub Actions (CI/CD)
* Docker

---

## 📁 Project Structure

```
.
├── .github/workflows/deploy.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── provider.tf
│   ├── modules/
│   │   ├── ecs/
│   │   ├── alb/
│   │   ├── security-group/
│   │   └── codedeploy/
├── my-strapi-app/
└── README.md
```

---

## 🔄 CI/CD Workflow

1. Push code to `main` branch
2. GitHub Actions triggers pipeline
3. Build Docker image
4. Push image to Amazon ECR
5. Register new ECS Task Definition
6. Generate AppSpec file
7. Upload AppSpec to S3
8. Trigger CodeDeploy deployment
9. Traffic shifts from **Blue → Green**

---

## 🔐 Prerequisites

* AWS Account
* IAM Roles:

  * ECS Task Execution Role
  * CodeDeploy Role
* S3 Bucket for AppSpec
* ECR Repository

---

## 🚀 Setup Instructions

### 1️⃣ Clone Repository

```bash
git clone <your-repo-url>
cd <your-repo>
```

---

### 2️⃣ Deploy Infrastructure (Terraform)

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

---

### 3️⃣ Create S3 Bucket

```bash
aws s3 mb s3://strapi-codedeploy-libin --region us-east-1
```

---

### 4️⃣ Push Code (Trigger CI/CD)

```bash
git add .
git commit -m "Initial deployment"
git push origin main
```

---

## 🔁 Deployment Strategy

* **Blue Environment** → Current version
* **Green Environment** → New version
* CodeDeploy gradually shifts traffic using:

  * `CodeDeployDefault.ECSCanary10Percent5Minutes`

---

## 📊 Features

* Zero downtime deployment
* Automatic rollback on failure
* Scalable serverless containers (Fargate)
* Fully automated CI/CD pipeline

---

## 🧠 Key Learnings

* ECS Fargate architecture
* Blue/Green deployment strategy
* Infrastructure as Code using Terraform
* CI/CD automation with GitHub Actions
* AWS networking and security

---

## 📌 Future Improvements

* Add HTTPS (ACM + ALB Listener 443)
* Add CloudWatch monitoring & alerts
* Add Auto Scaling for ECS service
* Use Terraform remote state with locking

---

## 👨‍💻 Author

**Libin**

---

## ⭐ Conclusion

This project showcases a **production-ready DevOps pipeline** using AWS services with modern deployment strategies like Blue/Green for high availability and zero downtime.

---
