# Variables

variable "tags" {
  type        = map(string)
  description = "Tags applied to the AWS resources."
  default     = {}
}