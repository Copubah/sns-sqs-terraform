output "sns_topic_arn" {
  value = aws_sns_topic.order_notifications.arn
}

output "inventory_queue_url" {
  value = aws_sqs_queue.inventory_queue.url
}

output "shipping_queue_url" {
  value = aws_sqs_queue.shipping_queue.url
}

output "analytics_queue_url" {
  value = aws_sqs_queue.analytics_queue.url
}
