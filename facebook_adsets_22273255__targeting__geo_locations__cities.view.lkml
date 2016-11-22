view: fb_targeting_geo {
  sql_table_name: facebook_ads.facebook_adsets_22273255__targeting__geo_locations__cities ;;

#   dimension_group: _sdc_batched {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_batched_at ;;
#   }
#
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
#
#   dimension: country {
#     type: string
#     sql: ${TABLE}.country ;;
#   }

  dimension: distance_unit {
    type: string
    sql: ${TABLE}.distance_unit ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: radius {
    type: number
    sql: ${TABLE}.radius ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: region_id {
    type: string
    sql: ${TABLE}.region_id ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [name]
#   }
}
