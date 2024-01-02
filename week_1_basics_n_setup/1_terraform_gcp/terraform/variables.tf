
variable "region" {
  description = "Project Region"
  default     = "northamerica-northeast2"
}

variable "project" {
  description = "Project"
  default     = "rich-wavelet-408011"
}

variable "credentials" {
  description = "Project Credentials"
  default     = "/workspaces/thomas-de-zoomcamp-week-1/week_1_basics_n_setup/1_terraform_gcp/terraform/keys/my-creds.json"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery dataset name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My storage bucket name"
  default     = "rich-wavelet-408011-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
