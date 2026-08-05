resource "aws_instance" "terraform_name" {
  count = 10
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_terraform.id]

  tags = var.ec2_tags
}
# it creates in default vpc
resource "aws_security_group" "allow_terraform" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }


  tags = var.sg_tags

}