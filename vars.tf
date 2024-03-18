variable "ec2_ami" {
  type = string
  default = "ami-067d1e60475437da2"
}
variable "aws_instance_type" {
  type = string
  default = "t2.micro"
}
variable "vpc_id" {
  type = string
  default = "vpc-04f8dc58be237a0b9"
}