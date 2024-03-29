resource "aws_cloudwatch_event_rule" "schedule" {
  for_each            = var.schedules
  name                = "${var.function.function_name}-${each.key}-schedule"
  description         = each.value.description != null ? each.value.description : "Invokes ${var.function.function_name} ${each.key}"
  schedule_expression = each.value.schedule
}

resource "aws_cloudwatch_event_target" "schedule" {
  for_each  = var.schedules
  rule      = aws_cloudwatch_event_rule.schedule[each.key].name
  target_id = "lambda"
  arn       = var.function.arn
  input     = each.value.input
}

resource "aws_lambda_permission" "schedule" {
  for_each            = var.schedules
  statement_id_prefix = each.key
  action              = "lambda:InvokeFunction"
  function_name       = var.function.function_name
  principal           = "events.amazonaws.com"
  source_arn          = aws_cloudwatch_event_rule.schedule[each.key].arn
}
