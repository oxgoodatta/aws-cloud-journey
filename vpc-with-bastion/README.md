📘 README.md — Secure Access to Private EC2 Instances in AWS VPC
🔧 Project Summary
This project demonstrates how to securely access a private EC2 instance in a VPC setup using three different methods. The infrastructure includes:

A Bastion Host in the public subnet.

A Private EC2 instance in the private subnet.

A NAT Gateway in the public subnet for outbound internet access from the private subnet.

🏗️ Architecture Overview

An Internet Gateway attached to the VPC.
```

                          ┌─────────────────────────────────────────┐
                          │                VPC                     │
                          │                                         │
                          │   ┌────────────┐        ┌────────────┐ │
Internet ◄── IGW ◄─────►  │   │ Bastion EC2│ SSH    │ Private EC2│ │
                          │   │ (Public)   │ ─────► │ (Private)  │ │
                          │   └────────────┘        └────────────┘ │
                          │         │                   ▲          │
                          │         ▼                   │          │
                          │     NAT Gateway ─────────────          │
                          └─────────────────────────────────────────┘

```

🔐 Secure EC2 Access Methods
✅ 1. AWS SSM Session Manager (Recommended Method)
🔒 Most secure — no need for SSH key, no open ports, no public IP.

Requirements:

EC2 must have:

IAM role with SSM policies (e.g., AmazonSSMManagedInstanceCore)

SSM agent installed and running

Internet access via NAT Gateway

Command (with AWS CLI profile):

```
aws ssm start-session --target <instance-id> --profile terraform-user
```
✅ 2. SSH via Bastion Host (ProxyJump)
🔐 Secure way to jump from a public EC2 into a private EC2.

Steps:

Your Bastion Host (Public EC2) must allow inbound SSH (port 22) from your IP.

Your Private EC2 must allow SSH from the Bastion EC2 (via Security Group rules).

SSH Command:

```
ssh -J ec2-user@<bastion-public-ip> ec2-user@<private-ec2-private-ip> -i <your-key.pem>
```

⚠️ 3. Direct SSH from the bastion host (Not Recommended for Production)
🟡 Only possible if the bastion has port 22  opened to your IP and and also a copy of the key.pem 
in the bastian.

SSH Command:
```
scp -i <your-key.pem> <your-key.pem> bastion@<public-ip>
ssh -i <your-key.pem> bastion@<public-ip>
ssh -i <your-key.pem> privateec2@<public-ip>

```
⚠️ This method was only used for demonstration and is not secure for production environments.

✅ Which is Safer?
| Method                  | Security  | Public IP Needed     | SSH Key Required | Comments                      |
| ----------------------- | --------  | -------------------- | ---------------- | ----------------------------- |
| **SSM**                 | 🔒🔒🔒  | ❌ No                 | ❌ No             | Best practice for production  |
| **Bastion + ProxyJump** | 🔒🔒     | ✅ Yes (Bastion only) | ✅ Yes            | Secure if properly configured |
| **Direct SSH**          | 🔓       | ✅ Yes                | ✅ Yes            | Not recommended               |


🧠 Notes
The NAT Gateway was essential for allowing the private EC2 to connect to the internet for updates and to allow SSM to function properly.

IAM Roles were used instead of hardcoded credentials.

All security groups followed least privilege principles.

All configurations are reusable in Terraform for scalable infrastructure.



