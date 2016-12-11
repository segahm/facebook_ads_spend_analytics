view: ga_geo {
  sql_table_name: geo.report ;;

  dimension: _rjm_record_hash {
    type: string
    primary_key:  yes
    sql: ${TABLE}._rjm_record_hash ;;
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
#   dimension: avg_session_duration {
#     type: number
#     sql: ${TABLE}.avgSessionDuration ;;
#   }

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
    drill_fields: [city]
  }

  dimension_group: date_hour {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}."dateHour" ;;
  }
#
#   dimension_group: enddate {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}."end-date" ;;
#   }

#   dimension: hits {
#     type: number
#     sql: ${TABLE}.hits ;;
#   }
#
#   dimension: latitude {
#     type: number
#     sql: ${TABLE}.latitude ;;
#   }
#
#   dimension: longitude {
#     type: number
#     sql: ${TABLE}.longitude ;;
#   }

  dimension: minute {
    type: string
    sql: ${TABLE}.minute ;;
  }
#
#   dimension: new_users {
#     type: number
#     sql: ${TABLE}.newUsers ;;
#   }
#
#   dimension_group: startdate {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}."start-date" ;;
#   }
#
#   dimension: users {
#     type: number
#     sql: ${TABLE}.users ;;
#   }

  measure: count {
    type: count
    drill_fields: []
  }
}
