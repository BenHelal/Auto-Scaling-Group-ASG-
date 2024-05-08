provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "instance" {
  name        = "instance-sg"
  description = "Allow inbound traffic"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
