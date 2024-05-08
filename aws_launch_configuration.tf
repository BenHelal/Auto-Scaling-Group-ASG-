provider "aws" {
  region = "us-west-2"
}

resource "aws_launch_configuration" "example" {
  name                 = "example-lc"
  image_id             = "ami-123456"
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.instance.id]
  user_data            = <<-EOF
                           #!/bin/bash
                           echo "Hello, World!" > index.html
                           nohup python -m SimpleHTTPServer 80 &
                         EOF
}
