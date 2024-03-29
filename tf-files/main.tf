resource "aws_security_group" "sg" {
  name   = "Project-SecurityGroup"
  vpc_id = data.aws_vpc.default.id
  tags = {
    Name = "Project-SG"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "project-instance" {
  ami             = data.aws_ami.project.id
  instance_type   = var.instance_type
  key_name        = var.key
  security_groups = [ aws_security_group.sg.name]
  user_data       = file("user-data.sh")
  tags = {
    "Name" = "Web Server - Bookstore" 
  }
}
