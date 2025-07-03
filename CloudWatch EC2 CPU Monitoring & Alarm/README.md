# 📈 CloudWatch EC2 CPU Monitoring & Alarm

This setup demonstrates how to monitor an EC2 instance's CPU usage using **Amazon CloudWatch**, and how to create an alarm that triggers when usage exceeds a certain threshold.

---

##  What I Did:

1️⃣ Created an Alarm for CPUUtilization

- Monitored metric: **CPUUtilization**
- Namespace: `AWS/EC2`
- Resource: Specific EC2 instance
- Threshold: **> 70% for 2 consecutive 1-minute periods**
- Action: Show alert in CloudWatch (can be linked to SNS later)

2️⃣ Stressed the EC2 CPU to Test It

SSH’ed into the instance and installed `stress`:

```bash
sudo apt update -y
sudo apt install stress -y
stress --cpu 1 --timeout 300
```
This simulated high CPU load for 5 minutes.



3️⃣ Verified Alarm & Metric Visualization
Verified CPU spike in CloudWatch > Metrics > EC2 > Per-Instance Metrics

Used “Add query” to filter and sort by highest CPU usage
![metric graph](./screenshots/Screenshot%20(220).png)

Alarm triggered successfully and was visible in CloudWatch Overview and EC2 Monitoring tab
![alarm triggered](./screenshots/Screenshot%20(221).png)

✅ Outcome
Learned how EC2 monitoring works under the hood

Tested real-time alarms and CPU metric visibility

Set up a real-world scenario to simulate system load

📸 Screenshots
![CloudWatch Alarm](./screenshots)


💡 Why This Matters
This scenario shows how real-world systems can be monitored automatically, allowing DevOps teams to:

Be alerted when servers are overloaded

Auto-scale infrastructure in response to load

Ensure uptime and performance

🔐 Security
No custom permissions required

IAM role or default permissions from EC2 are sufficient to push metrics