variable "name" {
  type        = string
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

variable "hostname" {
  type        = string
  description = "Name of website bucket in `fqdn` format (e.g. `test.example.com`). IMPORTANT! Do not add trailing dot (`.`)"
}

variable "parent_zone_id" {
  type        = string
  description = "ID of the hosted zone to contain the record"
  default     = ""
}

variable "index_document" {
  type        = string
  default     = "index.html"
  description = "Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders"
}

variable "error_document" {
  type        = string
  default     = "404.html"
  description = "An absolute path to the document to return in case of a 4XX error"
}

variable "routing_rules" {
  type        = string
  default     = ""
  description = "A json array containing routing rules describing redirect behavior and when redirects are applied"
}

variable "cors_allowed_headers" {
  type        = list(string)
  default     = ["*"]
  description = "List of allowed headers"
}

variable "cors_allowed_methods" {
  type        = list(string)
  default     = ["GET"]
  description = "List of allowed methods (e.g. ` GET, PUT, POST, DELETE, HEAD`) "
}

variable "cors_allowed_origins" {
  type        = list(string)
  default     = ["*"]
  description = "List of allowed origins (e.g. ` example.com, test.com`)"
}

variable "cors_expose_headers" {
  type        = list(string)
  default     = ["ETag"]
  description = "List of expose header in the response"
}

variable "cors_max_age_seconds" {
  type        = string
  default     = "3600"
  description = "Time in seconds that browser can cache the response"
}

variable "region" {
  type        = string
  default     = ""
  description = "AWS region this bucket should reside in"
}

variable "versioning_enabled" {
  type        = bool
  default     = "true"
  description = "State of versioning (e.g. `true` or `false`)"
}

variable "force_destroy" {
  type        = bool
  default     = "false"
  description = "Delete all objects from the bucket so that the bucket can be destroyed without error (e.g. `true` or `false`)"
}

