variable "subnets" {
  type        = set(string) # Best practice: Use a set for unique string keys
  description = "Set of subnet names"
}