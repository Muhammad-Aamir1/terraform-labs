variable "gcp_project_id" {
  type        = string
  description = "Your actual GCP Project ID"
}

variable "gcp_region" {
  type        = string
  default     = "us-central1"
  description = "GCP region"
}

variable "user_directory" {
  type = map(object({
    full_name  = string
    department = string
  }))
  default = {
    "r-das" = {
      full_name  = "Rahul Das"
      department = "engineering"
    }
    "a-sharma" = {
      full_name  = "Aman Sharma"
      department = "hr"
    }
    "p-patel" = {
      full_name  = "Pooja Patel"
      department = "engineering"
    }
    "v-kumar" = {
      full_name  = "Vikram Kumar"
      department = "marketing"
    }
    "s-nair" = {
      full_name  = "Siddharth Nair"
      department = "engineering"
    }
  }
}
