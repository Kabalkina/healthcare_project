variable "project" {
  description = "Project"
  default     = "orthopedic-surgeries"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "europe-west1-b"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "EU"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "orthopedic-surgeries_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "orthopedic-surgeries-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}