# 🚀 Strapi Deployment on AWS ECS Fargate using Terraform & CI/CD

## 📌 Project Overview

This project demonstrates how to deploy a **Strapi (Node.js CMS)** application on **AWS ECS Fargate** using **Terraform (Infrastructure as Code)** and automate the deployment using **GitHub Actions (CI/CD pipeline)**.

The architecture follows **production-level best practices**, including a custom VPC, Application Load Balancer, and containerized deployment.

---

## 🏗️ Architecture

```
User → ALB → Target Group → ECS Service → Fargate Task (Strapi)
```

### Components:

* **VPC** with public subnets
* **Application Load Balancer (ALB)** for traffic routing
* **ECS Cluster (Fargate)** for container execution
* **ECR** for storing Docker images
* **CloudWatch** for logging and monitoring
* **GitHub Actions** for CI/CD automation

---

## ⚙️ Technologies Used

* AWS ECS (Fargate)
* AWS ALB (Application Load Balancer)
* AWS ECR (Elastic Container Registry)
* AWS CloudWatch
* Terraform
* Docker
* GitHub Actions

---

## 📂 Terraform Structure

```
terraform/
├── provider.tf       # AWS provider configuration
├── vpc.tf            # VPC, subnets, IGW, route tables
├── security.tf       # Security groups
├── alb.tf            # ALB, target group, listener
├── ecs.tf            # ECS cluster, task definition, service
├── variables.tf      # Input variables
├── outputs.tf        # Outputs (ALB DNS)
```

---

## 🔧 Setup Instructions

### 1. Clone Repository

```bash
git clone https://github.com/Libin2004/docker-strapi.git
cd docker-strapi
```

---

### 2. Initialize Terraform

```bash
cd terraform
terraform init
```

---

### 3. Apply Infrastructure

```bash
terraform apply
```

---

### 4. Access Application

After deployment, Terraform will output:

```
alb_dns = <your-load-balancer-url>
```

Open it in your browser.

---

## 🐳 CI/CD Pipeline (GitHub Actions)

The pipeline performs:

1. Build Docker image
2. Tag the image
3. Push to AWS ECR
4. Update ECS task definition
5. Deploy new version automatically

---

## 📊 Monitoring

* Logs are sent to **CloudWatch Logs**
* ECS metrics (CPU, Memory) are monitored via **CloudWatch**
* ALB health checks ensure service availability

---

## 🔐 Security

* ALB is publicly accessible (port 80)
* ECS tasks are accessed only via ALB
* Security groups restrict direct access to containers

---

## ⚠️ Improvements (Future Enhancements)

* Add HTTPS using ACM
* Move ECS to private subnet with NAT Gateway
* Add Auto Scaling based on CPU/Memory
* Integrate RDS for persistent database

---

## 🎯 Key Features

* Infrastructure as Code using Terraform
* Serverless container deployment using Fargate
* Load balancing with ALB
* Automated CI/CD pipeline
* Scalable and production-ready architecture

---

## 🧠 Learning Outcomes

* ECS & Fargate architecture
* Terraform modular structure
* CI/CD automation with GitHub Actions
* AWS networking (VPC, subnets, security groups)
* Load balancing and monitoring

---

## 📌 Author

**Sahaya Libin**

* Passionate about DevOps & Cloud Technologies
* Skilled in Linux, AWS, Docker, CI/CD, and Monitoring

---
