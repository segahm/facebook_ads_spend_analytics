view: heap {
  sql_table_name: public.heap ;;

  dimension: initial_browser {
    type: string
    sql: ${TABLE}.initial_browser ;;
  }

  dimension: initial_city {
    type: string
    sql: ${TABLE}.initial_city ;;
  }

  dimension: initial_country {
    type: string
    sql: ${TABLE}.initial_country ;;
  }

  dimension: initial_device_type {
    type: string
    sql: ${TABLE}.initial_device_type ;;
  }

  dimension: initial_landing_page {
    type: string
    sql: ${TABLE}.initial_landing_page ;;
  }

  dimension: initial_platform {
    type: string
    sql: ${TABLE}.initial_platform ;;
  }

  dimension: initial_referrer {
    type: string
    sql: ${TABLE}.initial_referrer ;;
  }

  dimension: initial_region {
    type: string
    sql: ${TABLE}.initial_region ;;
  }

  dimension: initial_utm_campaign {
    type: string
    sql: ${TABLE}.initial_utm_campaign ;;
  }

  dimension: initial_utm_content {
    type: string
    sql: ${TABLE}.initial_utm_content ;;
  }

  dimension: initial_utm_medium {
    type: string
    sql: ${TABLE}.initial_utm_medium ;;
  }

  dimension: initial_utm_source {
    type: string
    sql:
      CASE
        WHEN ${initial_referrer} LIKE '%facebook%'
              OR ${initial_referrer} LIKE '%instagram%'
              OR ${TABLE}.initial_utm_source iLIKE 'facebook' THEN 'facebook'
        END;;
  }

#   dimension: initial_utm_term {
#     type: string
#     sql:
#     CASE
#       WHEN initial_landing_page ILIKE '%fbad%'
#       THEN array_to_string(regexp_matches(initial_landing_page,'fbad\%3D([^&]+)'),',')
#       ELSE ${TABLE}.initial_utm_term
#     END;;
#   }

  dimension_group: joindate {
    type: time
#     hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.joindate ;;
  }

  dimension_group: lastseen {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.lastseen ;;
  }

  dimension: user_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.user_id::text ;;
  }

  measure: count_users {
    type: count
    drill_fields: []
  }
}
