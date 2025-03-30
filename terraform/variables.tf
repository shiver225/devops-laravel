variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Default region for resources"
  type        = string
  default     = "us-central1"
}

variable "database_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "laravel"
}

variable "database_user" {
  description = "PostgreSQL database user"
  type        = string
  default     = "laravel_user"
}
