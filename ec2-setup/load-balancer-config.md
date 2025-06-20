# Load Balancer Configuration

## Summary
- Created a target group with two EC2 instances (Webserver 1 and Webserver 2)
- Initially used a new security group for the Load Balancer — site returned "This site can't be reached"
- Switched to the same security group used by EC2 instances (port 80 and 22 open) — then it worked

## Key Learnings
- Load balancer needs correct security group to communicate with instances
- Target group health checks determine if routing is successful
