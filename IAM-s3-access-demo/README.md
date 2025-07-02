# 🔐 IAM + S3 Access Demo

This documents two ways to securely access S3 buckets using IAM:

---

## 1️⃣ IAM User with Read-Only Policy

### What Was Done:
- Created an IAM user via the Console
- Assigned **AmazonS3ReadOnlyAccess** policy
- Configured access in PowerShell using:

```bash
aws configure --profile readonly-user


### Verified access with:

aws s3 ls s3://your-bucket-name --profile readonly-user
