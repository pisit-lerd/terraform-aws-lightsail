# variable "access_key" {
#   type = string
#   description = "Access key to AWS console"
# }

# variable "secret_key" {
#   type = string
#   description = "Secret key to AWS console"
# }

variable "aws_region" {
  type        = string
  default     = "ap-southeast-1"
  description = "Set up our region, that we want to use"
}
variable "project_name" {
  description = "Project's Names"
  type        = string
}
variable "bundle_id" {
  type        = string
  default     = "nano_2_0"
  description = "Options for instance size"
}
## list bundle_id
# nano_2_0
# micro_2_0
# small_2_0
# medium_2_0
# large_2_0
# xlarge_2_0
# 2xlarge_2_0


variable "lightsail_blueprints" {
 type        = string
 default     = "ubuntu_22_04"
 description = "The ID for a virtual private server image"
}  

# variable "lightsail_blueprints" {
#  type        = map(string)
#  description = "The ID for a virtual private server image. A list of available blueprint AWS CLI command: aws lightsail get-blueprints"
# }  