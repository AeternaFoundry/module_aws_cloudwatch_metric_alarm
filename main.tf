resource "aws_cloudwatch_metric_alarm" "cloudwatch_metric_alarms" {
  for_each = var.cloudwatch_metric_alarms

  alarm_name                            = each.value.alarm_name
  threshold_metric_id                   = each.value.threshold_metric_id
  threshold                             = each.value.threshold
  tags_all                              = each.value.tags_all
  tags                                  = each.value.tags
  statistic                             = each.value.statistic
  region                                = each.value.region
  period                                = each.value.period
  ok_actions                            = each.value.ok_actions
  namespace                             = each.value.namespace
  metric_name                           = each.value.metric_name
  insufficient_data_actions             = each.value.insufficient_data_actions
  extended_statistic                    = each.value.extended_statistic
  evaluation_periods                    = each.value.evaluation_periods
  evaluation_interval                   = each.value.evaluation_interval
  evaluate_low_sample_count_percentiles = each.value.evaluate_low_sample_count_percentiles
  dimensions                            = each.value.dimensions
  datapoints_to_alarm                   = each.value.datapoints_to_alarm
  comparison_operator                   = each.value.comparison_operator
  alarm_description                     = each.value.alarm_description
  alarm_actions                         = each.value.alarm_actions
  actions_enabled                       = each.value.actions_enabled
  treat_missing_data                    = each.value.treat_missing_data
  unit                                  = each.value.unit

  dynamic "evaluation_criteria" {
    for_each = each.value.evaluation_criteria != null ? [each.value.evaluation_criteria] : []
    content {
      promql_criteria {
        pending_period  = evaluation_criteria.value.promql_criteria.pending_period
        query           = evaluation_criteria.value.promql_criteria.query
        recovery_period = evaluation_criteria.value.promql_criteria.recovery_period
      }
    }
  }

  dynamic "metric_query" {
    for_each = each.value.metric_query != null ? each.value.metric_query : []
    content {
      account_id = metric_query.value.account_id
      expression = metric_query.value.expression
      id         = metric_query.value.id
      label      = metric_query.value.label
      dynamic "metric" {
        for_each = metric_query.value.metric != null ? [metric_query.value.metric] : []
        content {
          dimensions  = metric.value.dimensions
          metric_name = metric.value.metric_name
          namespace   = metric.value.namespace
          period      = metric.value.period
          stat        = metric.value.stat
          unit        = metric.value.unit
        }
      }
      period      = metric_query.value.period
      return_data = metric_query.value.return_data
    }
  }
}

