terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

# ---------------------------
# SNS topic + e-post subscription
# ---------------------------
resource "aws_sns_topic" "sentiment_alerts" {
  name = "kandidat61-sentiment-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.sentiment_alerts.arn
  protocol  = "email"
  endpoint  = "eunjungp615@gmail.com" 

}

# ---------------------------
# CloudWatch Alarm – API latency
# ---------------------------
resource "aws_cloudwatch_metric_alarm" "latency_high" {
  alarm_name          = "kandidat61-sentiment-api-latency-high"
  alarm_description   = "Alarm when average API latency is too high"
  namespace           = "kandidat61"             # MÅ matche MetricsConfig
  metric_name         = "sentiment.api.latency"  # MÅ matche SentimentMetrics
  statistic           = "Average"
  period              = 60                       # 60 sekunder per datapunkt
  evaluation_periods  = 1
  threshold           = 2000                     # 2000 ms = 2 sek
  comparison_operator = "GreaterThanThreshold"

  treat_missing_data = "missing"

  alarm_actions = [
    aws_sns_topic.sentiment_alerts.arn
  ]
}

# ---------------------------
# CloudWatch Dashboard
# ---------------------------
resource "aws_cloudwatch_dashboard" "sentiment_dashboard" {
  dashboard_name = "kandidat61-sentiment-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        "type" = "metric"
        "x"    = 0
        "y"    = 0
        "width"  = 12
        "height" = 6
        "properties" = {
          "title"   = "Sentiment API latency (Average)"
          "metrics" = [
            # [Namespace, MetricName, "stat", "Average"]
            ["kandidat61", "sentiment.api.latency", "stat", "Average"]
          ]
          "region" = "eu-west-1"
          "view"   = "timeSeries"
          "stat"   = "Average"
          "period" = 60
        }
      },
      {
        "type" = "metric"
        "x"    = 0
        "y"    = 6
        "width"  = 12
        "height" = 4
        "properties" = {
          "title"   = "Companies detected per request"
          "metrics" = [
            ["kandidat61", "sentiment.companies.detected", "stat", "Average"]
          ]
          "region" = "eu-west-1"
          "view"   = "singleValue"   # viser siste verdi som et tall
          "stat"   = "Average"
          "period" = 60
        }
      }
    ]
  })
}
