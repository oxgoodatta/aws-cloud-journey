# Auto Scaling Group Configuration

## Settings
- Minimum capacity: 1
- Maximum capacity: 3
- Target CPU Utilization: 50%
- Launch Template required (as of Dec 31, 2023)

## Behavior
- When an instance was terminated, ASG launched another automatically
- Template ensured Apache and web content were already installed

## Realization
Auto Scaling is great for maintaining availability and cost-efficiency. It only works with a launch template now.
