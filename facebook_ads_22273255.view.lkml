view: fb_ads {
  sql_table_name: facebook_ads.facebook_ads_22273255 ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
#
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

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

#   dimension: bid_info__actions {
#     type: number
#     sql: ${TABLE}."bid_info__ACTIONS" ;;
#   }
#
#   dimension: bid_info__impressions {
#     type: number
#     sql: ${TABLE}."bid_info__IMPRESSIONS" ;;
#   }
#
#   dimension: bid_info__reach {
#     type: number
#     sql: ${TABLE}."bid_info__REACH" ;;
#   }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
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

  dimension: creative__id {
    type: string
    sql: ${TABLE}.creative__id ;;
  }
#
#   dimension: effective_status {
#     type: string
#     sql: ${TABLE}.effective_status ;;
#   }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

#   dimension: targeting__age_max {
#     type: number
#     sql: ${TABLE}.targeting__age_max ;;
#   }
#
#   dimension: targeting__age_min {
#     type: number
#     sql: ${TABLE}.targeting__age_min ;;
#   }
#
#   dimension_group: updated {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}.updated_time ;;
#   }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
