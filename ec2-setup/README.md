# EC2 Infrastructure Setup (Manual)

## Summary

This documents my EC2 infrastructure journey, built fully from scratch through the AWS Console and PowerShell.

## Highlights

- Launched 2 Ubuntu EC2 instances with shared volume and security group
- Installed Apache, configured servers via SSH using PowerShell
- Manually set unique content for each server ("Webserver 1" and "Webserver 2")
- Configured Load Balancer using a shared security group
- Set up Auto Scaling Group with min 1, max 3 and CPU threshold of 50%
- Learned real AWS behavior, fixed issues like inaccessible DNS due to wrong SG

## Why It Matters

This setup mimics how websites and services maintain high availability and scale dynamically based on demand.

See scripts and config files in this folder.
