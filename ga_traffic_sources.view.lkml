view: ga_traffic_sources {
  sql_table_name: traffic_sources.report ;;

  dimension: _rjm_record_hash {
    type: string
    sql: ${TABLE}._rjm_record_hash ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: avg_session_duration {
    type: number
    sql: ${TABLE}.avgSessionDuration ;;
  }

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension_group: date_hour {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dateHour ;;
  }

  dimension_group: enddate {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."end-date" ;;
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.newUsers ;;
  }
  measure:  total_hits {
    type:  sum
    sql:  ${hits} ;;
  }

  measure:  total_new_users {
    type:  sum
    sql:  ${new_users} ;;
  }

  dimension: referral_path {
    type: string
    sql: ${TABLE}.referralPath ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: social_network {
    type: string
    sql: ${TABLE}.socialNetwork ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_medium {
    type: string
    sql: ${TABLE}.sourceMedium ;;
  }

  dimension_group: startdate {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."start-date" ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: total_users {
    type: sum
    sql:  ${users} ;;
  }
}
