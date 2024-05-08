# Auto-Scaling-Group-ASG-
Terraform configuration that sets up an AWS Auto Scaling Group (ASG) with dynamic scaling policies based on CPU utilization. We'll use a custom metric alarm to trigger the scaling actions.
This example provides a basic setup for autoscaling based on CPU utilization using Terraform. Adjustments and enhancements can be made based on your specific requirements and infrastructure.


The graph starts with the aws_provider resource which defines the AWS region.
It connects to the aws_vpc resource that represents the Virtual Private Cloud (VPC).
The VPC connects to the aws_igw resource which is the Internet Gateway.
A aws_subnet is created within the VPC.
A aws_route_table is associated with the subnet, and the route table points to the internet gateway for internet access.
An aws_security_group named instance is created to allow all inbound traffic for the instances.
An aws_security_group named alb is created for the Application Load Balancer.
An aws_lb resource creates the Application Load Balancer (ALB).
An aws_alb_listener is attached to the ALB, listening on port 80 for HTTP traffic.
An aws_alb_target_group is created to manage the instances behind the ALB.
An aws_launch_configuration defines the configuration for the EC2 instances, including the AMI, instance type, and security group. It also includes user data that creates a simple web server serving an "Hello, World!" message.
An aws_autoscaling_group is created to manage the autoscaling of the EC2 instances. It references the launch configuration and the subnet.
Two aws_cloudwatch_metric_alarm resources are created:
High CPU Utilization alarm: This triggers the aws_autoscaling_policy.scale_out_policy when CPU utilization is above 70%.
Low CPU Utilization alarm: This triggers the aws_autoscaling_policy.scale_in_policy when CPU utilization is below 30%.
Finally, two aws_autoscaling_policy resources are defined:
scale-out-policy: This policy adds one instance to the autoscaling group when the high CPU utilization alarm is triggered.
scale-in-policy: This policy removes one instance from the autoscaling group when the low CPU utilization alarm is triggered.

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
