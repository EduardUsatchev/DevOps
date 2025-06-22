resource "aws_cloudwatch_dashboard" "example" {
  dashboard_name = "MyApp-Dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type  = "metric"
        x     = 0; y = 0; width = 12; height = 6
        properties = {
          metrics = [
            ["MyApp/Service","RequestLatency","ServiceName","OrderAPI",{stat:"Average"}]
          ]
          period = 60
          title  = "OrderAPI Latency"
        }
      },
      {
        type  = "text"
        x     = 0; y = 6; width = 24; height = 3
        properties = { markdown = "# MyApp Overview\\nLatency & Health Metrics" }
      }
    ]
  })
}
