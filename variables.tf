variable "cloudwatch_metric_alarms" {
  description = <<EOT
Map of cloudwatch_metric_alarms, attributes below
Required:
    - alarm_name
Optional:
    - actions_enabled
    - alarm_actions
    - alarm_description
    - comparison_operator
    - datapoints_to_alarm
    - dimensions
    - evaluate_low_sample_count_percentiles
    - evaluation_interval
    - evaluation_periods
    - extended_statistic
    - insufficient_data_actions
    - metric_name
    - namespace
    - ok_actions
    - period
    - region
    - statistic
    - tags
    - tags_all
    - threshold
    - threshold_metric_id
    - treat_missing_data
    - unit
    - evaluation_criteria (block):
        - promql_criteria (required, block):
            - pending_period (optional)
            - query (required)
            - recovery_period (optional)
    - metric_query (block):
        - account_id (optional)
        - expression (optional)
        - id (required)
        - label (optional)
        - metric (optional, block):
            - dimensions (optional)
            - metric_name (required)
            - namespace (optional)
            - period (required)
            - stat (required)
            - unit (optional)
        - period (optional)
        - return_data (optional)
EOT

  type = map(object({
    alarm_name                            = string
    threshold_metric_id                   = optional(string)
    threshold                             = optional(number)
    tags_all                              = optional(map(string))
    tags                                  = optional(map(string))
    statistic                             = optional(string)
    region                                = optional(string)
    period                                = optional(number)
    ok_actions                            = optional(set(string))
    namespace                             = optional(string)
    metric_name                           = optional(string)
    insufficient_data_actions             = optional(set(string))
    extended_statistic                    = optional(string)
    evaluation_periods                    = optional(number)
    evaluation_interval                   = optional(number)
    evaluate_low_sample_count_percentiles = optional(string)
    dimensions                            = optional(map(string))
    datapoints_to_alarm                   = optional(number)
    comparison_operator                   = optional(string)
    alarm_description                     = optional(string)
    alarm_actions                         = optional(set(string))
    actions_enabled                       = optional(bool)
    treat_missing_data                    = optional(string)
    unit                                  = optional(string)
    evaluation_criteria = optional(object({
      promql_criteria = object({
        pending_period  = optional(number)
        query           = string
        recovery_period = optional(number)
      })
    }))
    metric_query = optional(list(object({
      account_id = optional(string)
      expression = optional(string)
      id         = string
      label      = optional(string)
      metric = optional(object({
        dimensions  = optional(map(string))
        metric_name = string
        namespace   = optional(string)
        period      = number
        stat        = string
        unit        = optional(string)
      }))
      period      = optional(number)
      return_data = optional(bool)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.alarm_description == null || (length(v.alarm_description) >= 0 && length(v.alarm_description) <= 1024)
      )
    ])
    error_message = "must be between 0 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        length(v.alarm_name) >= 1 && length(v.alarm_name) <= 255
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.datapoints_to_alarm == null || (v.datapoints_to_alarm >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.evaluation_criteria == null || (v.evaluation_criteria.promql_criteria.pending_period == null || (v.evaluation_criteria.promql_criteria.pending_period >= 0 && v.evaluation_criteria.promql_criteria.pending_period <= 86400))
      )
    ])
    error_message = "must be between 0 and 86400"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.evaluation_criteria == null || (length(v.evaluation_criteria.promql_criteria.query) >= 1 && length(v.evaluation_criteria.promql_criteria.query) <= 10000)
      )
    ])
    error_message = "must be between 1 and 10000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.evaluation_criteria == null || (v.evaluation_criteria.promql_criteria.recovery_period == null || (v.evaluation_criteria.promql_criteria.recovery_period >= 0 && v.evaluation_criteria.promql_criteria.recovery_period <= 86400))
      )
    ])
    error_message = "must be between 0 and 86400"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.evaluation_interval == null || ((contains([10, 20, 30], v.evaluation_interval)) || ((v.evaluation_interval % 60) == 0))
      )
    ])
    error_message = "any of: must be one of: 10, 20, 30; must be divisible by 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.evaluation_periods == null || (v.evaluation_periods >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.extended_statistic == null || (can(regex("^((p|(tm)|(wm)|(tc)|(ts))((\\d{1,2}(\\.\\d{1,2})?)|(100))|(IQM)|(((TM)|(WM)|(PR)|(TC)|(TS)))\\((\\d+(\\.\\d+)?%?)?:(\\d+(\\.\\d+)?%?)?\\))$", v.extended_statistic)))
      )
    ])
    error_message = "invalid statistic, see: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.metric_query == null || alltrue([for item in v.metric_query : (item.metric == null || ((contains([1, 5, 10, 20, 30], item.metric.period)) || ((item.metric.period % 60) == 0)))])
      )
    ])
    error_message = "any of: must be one of: 1, 5, 10, 20, 30; must be divisible by 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.metric_query == null || alltrue([for item in v.metric_query : (item.period == null || ((contains([1, 5, 10, 20, 30], item.period)) || ((item.period % 60) == 0)))])
      )
    ])
    error_message = "any of: must be one of: 1, 5, 10, 20, 30; must be divisible by 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.period == null || ((contains([10, 20, 30], v.period)) || ((v.period % 60) == 0))
      )
    ])
    error_message = "any of: must be one of: 10, 20, 30; must be divisible by 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_metric_alarms : (
        v.threshold_metric_id == null || (length(v.threshold_metric_id) >= 1 && length(v.threshold_metric_id) <= 255)
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

