view: yandex {
  sql_table_name: public.yandex ;;
  dimension: visit_id  {
    primary_key: yes
    sql: md5(${time_visit_raw} || ${traffic_sources} || ${area});;
  }

  dimension: area {
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: landing_page_path {
    type: string
    sql: ${TABLE}.landing_page_path ;;
  }

  dimension: page_depth {
    type: number
    sql: ${TABLE}.page_depth ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: seesions {
    type: number
    sql: ${TABLE}.seesions ;;
  }

  dimension_group: time_visit {
    type: time
#     hidden: yes
    timeframes: [time,minute2, date, week, month, raw]
    sql: ${TABLE}.time_visit ;;
  }

  dimension: traffic_sources {
    type: string
    sql: ${TABLE}.traffic_sources ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: visit_duration {
    type: string
    sql: ${TABLE}.visit_duration ;;
  }

  measure: count {
    type: count
    label: "Count Visits"
    drill_fields: []
  }
  measure:  total_users {
    type:  sum
    sql:  ${users} ;;
  }
}
