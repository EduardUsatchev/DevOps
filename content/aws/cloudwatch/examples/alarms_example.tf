resource "aws_cloudwatch_metric_alarm" "high_latency" {
  alarm_name          = "High-Request-Latency"
  namespace           = "MyApp/Service"
  metric_name         = "RequestLatency"
  statistic           = "Average"
  comparison_operator = "GreaterThanThreshold"
  threshold           = 200
  period              = 60
  evaluation_periods  = 1
  alarm_actions       = [aws_sns_topic.alerts.arn]
}
