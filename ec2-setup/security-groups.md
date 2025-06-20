# Security Group Configuration

## Used for All EC2 Instances and Load Balancer (after fix)

- Port 22 (SSH) - for remote login via PowerShell
- Port 80 (HTTP) - to serve website publicly

## Note
Initially the load balancer used a new group (Which I'm sure port 80 wasn't opened for traffics) — switching back to the EC2's group fixed the accessibility issue.
