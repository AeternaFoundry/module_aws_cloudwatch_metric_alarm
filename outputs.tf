output "cloudwatch_metric_alarms_id" {
  description = "Map of id values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cloudwatch_metric_alarms_actions_enabled" {
  description = "Map of actions_enabled values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.actions_enabled if v.actions_enabled != null }
}
output "cloudwatch_metric_alarms_alarm_actions" {
  description = "Map of alarm_actions values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.alarm_actions if v.alarm_actions != null && length(v.alarm_actions) > 0 }
}
output "cloudwatch_metric_alarms_alarm_description" {
  description = "Map of alarm_description values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.alarm_description if v.alarm_description != null && length(v.alarm_description) > 0 }
}
output "cloudwatch_metric_alarms_alarm_name" {
  description = "Map of alarm_name values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.alarm_name if v.alarm_name != null && length(v.alarm_name) > 0 }
}
output "cloudwatch_metric_alarms_arn" {
  description = "Map of arn values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "cloudwatch_metric_alarms_comparison_operator" {
  description = "Map of comparison_operator values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.comparison_operator if v.comparison_operator != null && length(v.comparison_operator) > 0 }
}
output "cloudwatch_metric_alarms_datapoints_to_alarm" {
  description = "Map of datapoints_to_alarm values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.datapoints_to_alarm if v.datapoints_to_alarm != null }
}
output "cloudwatch_metric_alarms_dimensions" {
  description = "Map of dimensions values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.dimensions if v.dimensions != null && length(v.dimensions) > 0 }
}
output "cloudwatch_metric_alarms_evaluate_low_sample_count_percentiles" {
  description = "Map of evaluate_low_sample_count_percentiles values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.evaluate_low_sample_count_percentiles if v.evaluate_low_sample_count_percentiles != null && length(v.evaluate_low_sample_count_percentiles) > 0 }
}
output "cloudwatch_metric_alarms_evaluation_criteria" {
  description = "Map of evaluation_criteria values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => one(v.evaluation_criteria) if v.evaluation_criteria != null && length(v.evaluation_criteria) > 0 }
}
output "cloudwatch_metric_alarms_evaluation_interval" {
  description = "Map of evaluation_interval values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.evaluation_interval if v.evaluation_interval != null }
}
output "cloudwatch_metric_alarms_evaluation_periods" {
  description = "Map of evaluation_periods values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.evaluation_periods if v.evaluation_periods != null }
}
output "cloudwatch_metric_alarms_extended_statistic" {
  description = "Map of extended_statistic values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.extended_statistic if v.extended_statistic != null && length(v.extended_statistic) > 0 }
}
output "cloudwatch_metric_alarms_insufficient_data_actions" {
  description = "Map of insufficient_data_actions values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.insufficient_data_actions if v.insufficient_data_actions != null && length(v.insufficient_data_actions) > 0 }
}
output "cloudwatch_metric_alarms_metric_name" {
  description = "Map of metric_name values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.metric_name if v.metric_name != null && length(v.metric_name) > 0 }
}
output "cloudwatch_metric_alarms_metric_query" {
  description = "Map of metric_query values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.metric_query if v.metric_query != null && length(v.metric_query) > 0 }
}
output "cloudwatch_metric_alarms_namespace" {
  description = "Map of namespace values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.namespace if v.namespace != null && length(v.namespace) > 0 }
}
output "cloudwatch_metric_alarms_ok_actions" {
  description = "Map of ok_actions values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.ok_actions if v.ok_actions != null && length(v.ok_actions) > 0 }
}
output "cloudwatch_metric_alarms_period" {
  description = "Map of period values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.period if v.period != null }
}
output "cloudwatch_metric_alarms_region" {
  description = "Map of region values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.region if v.region != null && length(v.region) > 0 }
}
output "cloudwatch_metric_alarms_statistic" {
  description = "Map of statistic values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.statistic if v.statistic != null && length(v.statistic) > 0 }
}
output "cloudwatch_metric_alarms_tags" {
  description = "Map of tags values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "cloudwatch_metric_alarms_tags_all" {
  description = "Map of tags_all values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "cloudwatch_metric_alarms_threshold" {
  description = "Map of threshold values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.threshold if v.threshold != null }
}
output "cloudwatch_metric_alarms_threshold_metric_id" {
  description = "Map of threshold_metric_id values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.threshold_metric_id if v.threshold_metric_id != null && length(v.threshold_metric_id) > 0 }
}
output "cloudwatch_metric_alarms_treat_missing_data" {
  description = "Map of treat_missing_data values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.treat_missing_data if v.treat_missing_data != null && length(v.treat_missing_data) > 0 }
}
output "cloudwatch_metric_alarms_unit" {
  description = "Map of unit values across all cloudwatch_metric_alarms, keyed the same as var.cloudwatch_metric_alarms"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms : k => v.unit if v.unit != null && length(v.unit) > 0 }
}

