# Auto-Scaling-Group-ASG-
Terraform configuration that sets up an AWS Auto Scaling Group (ASG) with dynamic scaling policies based on CPU utilization. We'll use a custom metric alarm to trigger the scaling actions.
This example provides a basic setup for autoscaling based on CPU utilization using Terraform. Adjustments and enhancements can be made based on your specific requirements and infrastructure.

+-----------------+      +-----------------+      +---------+
| aws_provider    | ---- | aws_vpc          | ---- | aws_igw |
+-----------------+      +-----------------+      +---------+
                             |
                             v
+-----------------+      +---------+      +---------+
| aws_subnet     | ---- | aws_rt   | ---- | aws_elb  |
+-----------------+      +---------+      +---------+
                             |                     |
                             v                     v
+-----------------+      +---------+      +---------+      +---------+
| aws_security_group | ---- | aws_lc  | ---- | aws_atg  | ---- | aws_alarm |
| (instance)       |      +---------+      +---------+      | (high cpu) |
+-----------------+                     |                     +---------+
                                         v                     |
+-----------------+      +---------+      +---------+      +---------+
| aws_security_group | ---- | aws_asg  | ---- | aws_alarm |
| (alb)             |      +---------+      +---------+      | (low cpu) |
+-----------------+                     |                     +---------+
                                         v
                                      +-----------------+
                                      | Auto Scaling    |
                                      | (in/out based    |
                                      | on CPU utilization) |
                                      +-----------------+

Define Requirements:
Autoscale based on CPU utilization.
Scale out if CPU utilization is above 70% for 2 consecutive periods of 5 minutes.
Scale in if CPU utilization is below 30% for 2 consecutive periods of 5 minutes.
Use t2.micro instances for the ASG.
Use an Application Load Balancer (ALB) to distribute traffic to instances.


Note: Replace placeholder values like ami-123456 with actual values.

Deploy Infrastructure:
Run terraform init and terraform apply to create the infrastructure.

Testing:
Monitor the ASG and ALB in the AWS Management Console. You can generate load on the instances to trigger the scaling actions and observe the behavior.
