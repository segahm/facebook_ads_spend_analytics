view: fb_conversion_type {
  sql_table_name: facebook_ads."facebook_ads_22273255__conversion_specs__action.type" ;;

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
#   dimension: _sdc_level_1_id {
#     type: number
#     sql: ${TABLE}._sdc_level_1_id ;;
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
    hidden:  yes
    primary_key: yes
    sql: ${TABLE}._sdc_source_key_id ;;
  }
#
#   dimension_group: _sdc_source_key_updated {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_source_key_updated_time ;;
#   }
#
#   dimension: _sdc_table_version {
#     type: number
#     sql: ${TABLE}._sdc_table_version ;;
#   }

  dimension: action_type {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
