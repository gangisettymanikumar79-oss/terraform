variable "ami_id" {
  type        = string
  description = "EC2 instance type for the web server"
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Deployment environment name"
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }

}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "terraform_name-1"
    Project     = "roboshop"
    Environment = "dev"
  }
}

variable "sg_name" {
  type    = string
  default = "allow_terraform_var"
}

variable "port" {
  default = 0
  type    = number
}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]

}

variable "sg_tags" {
  type = map(any)
  default = {
    Name        = "allow_terraform"
    Project     = "roboshop"
    Environment = "dev"

  }
}
