variable "origin_access_comment" {
  type    = string
  default = "Cloudfront origin access identity to restrict s3 access to only cloundfront"
}

variable "domain_name" {
  type = string
}

variable "enabled" {
  type = bool
}

variable "is_ipv6_enabled" {
  type = bool
}

variable "comment" {
  type = string
}

variable "default_root_object" {
  type = string
}

variable "allowed_methods" {
  type = list(string)
}

variable "cached_methods" {
  type = list(string)
}

variable "query_string" {
  type = string
}

variable "cookies" {
  type = string
}

variable "viewr_protocol_policy" {
  type = string
}

variable "min_ttl" {
  type = number
}

variable "default_ttl" {
  type = number
}

variable "max_ttl" {
  type = number
}

variable "restriction_type" {
  type = string
}

variable "locations" {
  type = list(string)
}

variable "cloudfront_default_certificate" {
  type = bool
}

variable "tags" {
  default = {
    created_by   = "Terraform",
    created_date = "",
    environment  = "dev",
    description  = "Created by Terraform"
  }
}
