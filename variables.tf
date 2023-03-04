variable "function" {
  type        = any
  description = "The lambda function that should be called based on the provided schedule."
  nullable = false
}

variable "schedules" {
  type = map(object({
    schedule    = string
    description = optional(string)
    input       = optional(string)
  }))
  description = "Schedules when your function should be invoked. Uses the schedule expression syntax of cloudwatch event rules(cron or rate). You can optionally pass input to the invoked function. This input must be valid JSON."
  nullable = false
}
