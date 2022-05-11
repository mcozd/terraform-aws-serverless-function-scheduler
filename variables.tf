variable "function" {
  type = object({
      arn = string
      name = string
  })
  description = "Provides information about the function that should be called."
}

variable "schedule" {
  type = string
}
