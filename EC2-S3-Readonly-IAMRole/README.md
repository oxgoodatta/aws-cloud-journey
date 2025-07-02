---

## 2️⃣ EC2 Instance with IAM Role (Read from S3 without Access Keys)

In this section, I tested how IAM **roles** can be used to securely grant S3 read access to an EC2 instance without storing access keys.

### 🔧 What I Did:

- Created an IAM **Role** with the `AmazonS3ReadOnlyAccess` policy
- Chose **EC2** as the trusted service
- Launched a new EC2 instance and attached the role
- SSH’d into the EC2 instance using PowerShell
- Installed the AWS CLI:
  ```bash
  sudo apt update -y
  sudo apt install awscli -y

### Listed files in the S3 bucket without using any credentials:
 aws s3 ls s3://your-bucket-name


#### Downloaded and read the content of a file:
aws s3 cp s3://your-bucket-name/message.txt .
cat message.txt

