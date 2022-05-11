resource "aws_cloudwatch_event_rule" "scheduled" {
  name                = "${var.function.name}-schedule"
  description         = "Calls the lambda regularly"
  schedule_expression = var.schedule
}

resource "aws_cloudwatch_event_target" "scheduled" {
  rule      = aws_cloudwatch_event_rule.scheduled.name
  target_id = "lambda"
  arn       = var.function.arn
}

resource "aws_lambda_permission" "scheduled" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = var.function.name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.scheduled.arn
}
