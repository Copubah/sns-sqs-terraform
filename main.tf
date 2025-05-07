provider "aws" {
  region = "us-west-2"
}

resource "aws_sns_topic" "order_notifications" {
  name = "order-notifications-topic"
}

resource "aws_sqs_queue" "inventory_queue" {
  name = "inventory-queue"
}

resource "aws_sqs_queue" "shipping_queue" {
  name = "shipping-queue"
}

resource "aws_sqs_queue" "analytics_queue" {
  name = "analytics-queue"
}

resource "aws_sns_topic_subscription" "inventory_subscription" {
  topic_arn = aws_sns_topic.order_notifications.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.inventory_queue.arn
  depends_on = [aws_sqs_queue.inventory_queue]
}

resource "aws_sns_topic_subscription" "shipping_subscription" {
  topic_arn = aws_sns_topic.order_notifications.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.shipping_queue.arn
  depends_on = [aws_sqs_queue.shipping_queue]
}

resource "aws_sns_topic_subscription" "analytics_subscription" {
  topic_arn = aws_sns_topic.order_notifications.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.analytics_queue.arn
  depends_on = [aws_sqs_queue.analytics_queue]
}

resource "aws_iam_role" "sns_sqs_role" {
  name = "sns-sqs-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "sns_sqs_policy" {
  role = aws_iam_role.sns_sqs_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["sqs:SendMessage"],
        Resource = [aws_sqs_queue.inventory_queue.arn, aws_sqs_queue.shipping_queue.arn, aws_sqs_queue.analytics_queue.arn]
      }
    ]
  })
}
