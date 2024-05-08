provider "aws" {
  region = "us-west-2"
}

resource "aws_autoscaling_group" "example" {
  name                 = "example-asg"
  max_size             = 5
  min_size             = 1
  desired_capacity     = 1
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.example.id
  vpc_zone_identifier  = [aws_subnet.example.id]
}
