view: heap_blog_property {
  sql_table_name: public.heap_blog_property ;;

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

  dimension: initial_utm_medium {
    type: string
    sql: ${TABLE}.initial_utm_medium ;;
  }

  dimension: initial_utm_source {
    type: string
    sql: ${TABLE}.initial_utm_source ;;
  }

  dimension: initial_utm_term {
    type: string
    sql: ${TABLE}.initial_utm_term ;;
  }

  dimension_group: joindate {
    type: time
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
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
