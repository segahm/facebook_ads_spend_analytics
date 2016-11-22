view: fb_adset {
  sql_table_name: facebook_ads.facebook_adsets_22273255 ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

#   dimension_group: _sdc_batched {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_batched_at ;;
#   }
#
#   dimension_group: _sdc_received {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_received_at ;;
#   }
#
#   dimension: _sdc_sequence {
#     type: number
#     sql: ${TABLE}._sdc_sequence ;;
#   }
#
#   dimension: _sdc_table_version {
#     type: number
#     sql: ${TABLE}._sdc_table_version ;;
#   }
#
#   dimension: account_id {
#     type: string
#     sql: ${TABLE}.account_id ;;
#   }

  dimension: bid_info__actions {
    type: number
    sql: ${TABLE}.bid_info__ACTIONS ;;
  }

  dimension: bid_info__impressions {
    type: number
    sql: ${TABLE}.bid_info__IMPRESSIONS ;;
  }

  dimension: bid_info__reach {
    type: number
    sql: ${TABLE}.bid_info__REACH ;;
  }

  dimension: budget_remaining {
    type: number
    sql: ${TABLE}.budget_remaining ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_time ;;
  }

  dimension: daily_budget {
    type: number
    sql: ${TABLE}.daily_budget ;;
  }

  dimension: effective_status {
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_time ;;
  }

  dimension: lifetime_budget {
    type: number
    sql: ${TABLE}.lifetime_budget ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: promoted_object__page_id {
    type: string
    sql: ${TABLE}.promoted_object__page_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time ;;
  }
  dimension: targeting__age_max {
    type: number
    sql: ${TABLE}.targeting__age_max ;;
  }

  dimension: targeting__age_min {
    type: number
    sql: ${TABLE}.targeting__age_min ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_time ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
