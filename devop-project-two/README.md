FashionForward E-Commerce Platform DevOps Project
📖 Overview
This project simulates a real-world DevOps task: transforming a monolithic, non-scalable e-commerce application ("FashionForward") into a highly available, auto-scaling, cloud-native platform ready for traffic spikes like Black Friday. The goal was to prevent a repeat of a catastrophic crash that cost the company millions in lost sales.

The project demonstrates a complete DevOps pipeline using industry-standard tools:


Docker for containerization.

Kubernetes (EKS) for orchestration and auto-scaling. (minikube for practice)

🎯 The Problem
FashionForward's original infrastructure was a monolithic Flask application running on manually configured EC2 instances. This led to:

No High Availability: Instance failures caused downtime.

No Scalability: Could not handle sudden traffic increases.

Fragile Deployments: "Click-ops" management was error-prone and not reproducible.

Predictable Failure: The system crashed during peak sales events.

🛠️ The Solution
A complete infrastructure overhaul implementing DevOps best practices:

Containerization: The Flask app was Dockerized to ensure consistency across all environments.

Orchestration: The application was deployed on Kubernetes (Amazon EKS) for self-healing and easy management.

Auto-Scaling: A Horizontal Pod Autoscaler (HPA) was configured to automatically add or remove application instances based on CPU load.


📦 Project Structure

```
devop-project-two/
├── k8s/                         # Kubernetes Manifest Files
│   ├── deployment.yaml          # Defines the app deployment, resources, and probes
│   ├── service.yaml             # Creates a network service for the pods
│   ├── hpa.yaml                 # Configures the Horizontal Pod Autoscaler
│   └── ingress.yaml             # Configures external access (Ingress)
├── terraform/                   # Infrastructure as Code
│   ├── providers.tf             # Configures AWS and Kubernetes providers
│   ├── variables.tf             # Input variables for the Terraform config
│   ├── vpc.tf                   # Defines the VPC, subnets, NAT/Internet Gateways
│   └── iam.tf                   # Defines IAM roles for EKS
├── app.py                       # The monolithic Flask application
├── requirements.txt             # Python dependencies
├── Dockerfile                   # Instructions to build the application image
└── README.md                    # This file
```

🚀 Technologies Used
Technology	Purpose
Minikube	Container orchestration for deployment, scaling, and management
Docker	Containerization of the application for portability
Flask	Python web framework for the e-commerce application
✨ Key Features Implemented
High Availability: Application replicas run across multiple AWS Availability Zones.

Auto-Healing: Kubernetes automatically restarts failed containers and reschedules pods.

Auto-Scaling: The HPA automatically scales the number of application pods from 2 to 10 based on CPU utilization.


Blue-Green & Canary Ready: The Kubernetes setup provides the foundation for advanced deployment strategies.

🧪 Testing & Validation
The solution was tested locally using Minikube.

Load Testing: Simulated traffic spikes with hey to trigger the HPA and watch it automatically add pods.

Failure Testing: Manually deleted pods and terminated nodes to validate Kubernetes' self-healing capabilities.

Rolling Updates: Deployed new versions of the application with zero downtime.

📈 Lessons Learned
The importance of resource requests/limits in Kubernetes for effective auto-scaling.

The difference between development and production servers (e.g., Flask's built-in server vs. Gunicorn).

How to troubleshoot and resolve common issues like ImagePullBackOff and failed readiness probes.

The value of IaC for creating consistent, disposable environments.

🔜 Next Steps
This project lays the groundwork for a full production-grade system. Next steps would include:

Implementing a CI/CD pipeline (e.g., with GitHub Actions, ArgoCD, or Jenkins).

Setting up monitoring and alerting with Prometheus and Grafana.

Using Karpenter for more efficient and cost-effective node scaling.

Migrating from a mock database to a managed AWS RDS instance.

Securing the application with SSL certificates and network policies.