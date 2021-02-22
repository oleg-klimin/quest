variable "accessKey" {
  type        = string
  description = "AWS access key"
}

variable "secretKey" {
  type        = string
  description = "AWS secret key"
}

variable "awsZone" {
  type        = string
  description = "AWS zone name"
  default     = "us-west-2"
}

variable "instanceType" {
  type        = string
  description = "Instance type"
  default     = "t1.micro"
}

variable "baseImage" {
  type        = string
  description = "Instance base image (ami)"
  default     = "ami-0e999cbd62129e3b1"
}

variable "KeyPairName" {
  type        = string
  description = "ssh key pair name"
}

variable "subnetIds" {
  type        = list(string)
  description = "subnets for LB (should be at least 2 subnets)"
}

variable "vpcId" {
  type        = string
  description = "VPC for LB  target group"
}

variable "sslPolicy" {
  type        = string
  description = "SSL policy for HTTPs listener"
  default     = "ELBSecurityPolicy-2016-08"
}

variable "dnsZoneId" {
  type        = string
  description = "Route53 DNS Hosted zone ID"
}

variable "domain" {
  type        = string
  description = "main domain"
}

variable "subDomain" {
  type        = string
  description = "extra part of domain"
}
