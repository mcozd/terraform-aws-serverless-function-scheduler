variable "function" {
  type = object(any)
  description = "The lambda function that should be called based on the provided schedule."
}

variable "schedules" {
  type = map(object({
    schedule = string
    description = optional(string)
  }))
  description = "Schedules when your function should be invoked. Uses the schedule expression syntax of cloudwatch event rules(cron or rate)."
}
