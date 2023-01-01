resource "aws_cloudwatch_metric_alarm" "many_carts" {
  alarm_name          = "Threshold for over 5 carts -- ${var.candidate_id}"
  namespace           = var.candidate_id
  metric_name         = "carts.value"

  comparison_operator = "GreaterThanThreshold"
  threshold           = "4"
  evaluation_periods  = "3"
  period = "300"

  statistic = "Maximum"

  alarm_description = "En CloudWatch Alarm  som løses ut dersom antall handlekurver over tre repeternde perioder,på fem minutter, overstiger verdien 5"
  insufficient_data_actions = []
  alarm_actions = [aws_sns_topic.alarms.arn]
}