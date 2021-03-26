data "aws_availability_zones" "available" {
  state = "available"
}

variable "alltag" {
  description = "company name"
  default     = "honglab"
}

variable "vpc_cidr" {
  description = "VPC CIDR BLOCK : x.x.x.x/x"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR BLOCK : x.x.x.x/x"
  default     = "10.0.0.0/24"
}

variable "public_subnet_az" {
  description = "Public Subnet AZ : 0(A)~3(D)"
  default     = 0
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR BLOCK : x.x.x.x/x"
  default     = "10.0.10.0/24"
}

variable "private_subnet_az" {
  description = "Private Subnet AZ : 0(A)~3(D)"
  default     = 2
}
