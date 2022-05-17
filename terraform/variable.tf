variable "project" {
  description =  "Name of the Project"
  type        =  string
  default = "Zpostik"
}

variable "vpc_name" {
  description =  "Name of the component"
  type        =  string
  default = "eks_vpc"
}

variable "vpc_cidr" {
  description =  "Vpc-cidr-block"
  type        =  string
  default = "192.168.0.0/16"
}

variable "eks_cluster_name" {
  description =  "Name of the component"
  type        =  string
  default = "2048-game"
}