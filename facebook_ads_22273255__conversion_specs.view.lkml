view: fb_conversion_specs {
  sql_table_name: facebook_ads.facebook_ads_22273255__conversion_specs ;;

#   dimension_group: _sdc_batched {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_batched_at ;;
#   }

#   dimension: _sdc_level_0_id {
#     type: number
#     sql: ${TABLE}._sdc_level_0_id ;;
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

  dimension: _sdc_source_key_id {
    type: string
    primary_key: yes
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension_group: _sdc_source_key_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_source_key_updated_time ;;
  }

#   dimension: _sdc_table_version {
#     type: number
#     sql: ${TABLE}._sdc_table_version ;;
#   }

  measure: count {
    type: count
    drill_fields: []
  }
}
