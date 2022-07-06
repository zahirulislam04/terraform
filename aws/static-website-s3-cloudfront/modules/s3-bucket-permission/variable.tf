
variable "actions" {
  type = list(string)
}

variable "resources" {
  type = list(string)
}

variable "principals_type" {
  type = string
}

variable "principals_identifiers" {
  type = list(string)
}

variable "bucket_id" {
  type = string
}

variable "acl" {
  type = string
}

variable "block_public_acls" {
  type = bool
}

variable "block_public_policy" {
  type = bool
}

variable "restrict_public_buckets" {
  type = bool
}

variable "ignore_public_acls" {
  type = bool
}
