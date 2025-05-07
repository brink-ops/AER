variable "my_vpc" {
  type    = string
}
variable "allow_http" {
type    = string
}
variable "subnet_az1" {
type    = string
}
variable "subnet_az2" {
type    = string
}
variable "project" {
type    = string
default	= "Capstone"
}

variable "add_public_ip" {
  type    = bool
  default = true
}

variable "startup_script" {
  type = string
}
variable "instance_type" {
  type        = string
  default     = "t2.micro"
}
variable "instance_count_min" {
  type        = number
  default     = 1
}

variable "instance_count_max" {
  type        = number
  default     = 2
}
variable "my_lb" {
  type    = string
}
