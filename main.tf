data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}
variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = variable.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
