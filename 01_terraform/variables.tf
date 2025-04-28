variable "project" {
  description = "Project"
  default     = "orthopedic-surgeries"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "europe-west2"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "europe-west2"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "orthopedic_surgeries_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "orthopedic-surgeries-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}