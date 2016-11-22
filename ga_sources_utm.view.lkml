view: ga_sources_utm {
  sql_table_name: sources_by_date_and_utm.report ;;

  dimension: _rjm_record_hash {
    type: string
    primary_key: yes
    sql: ${TABLE}._rjm_record_hash ;;
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

  dimension: avg_session_duration {
    type: number
    sql: ${TABLE}."avgSessionDuration" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

#   dimension_group: enddate {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}."end-date" ;;
#   }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: social_network {
    type: string
    hidden:  yes
    sql: ${TABLE}."socialNetwork" ;;
  }

  dimension: source {
    type: string
    sql:
      (CASE WHEN ${TABLE}.source iLIKE 'facebook' OR  ${social_network} iLIKE 'facebook'
                OR ${source_medium} iLIKE 'facebook'
          THEN 'facebook'
      END);;
  }

  dimension: source_medium {
    type: string
    hidden: yes
    sql: ${TABLE}."sourceMedium" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."start-date" ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure:  total_users {
    type:  sum
    sql: ${users} ;;
  }
#
#   measure: count {
#     type: count
#     drill_fields: []
#   }
}
