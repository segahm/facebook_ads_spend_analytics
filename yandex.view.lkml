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

  dimension: custom_term {
    type: string
    sql:
      CASE WHEN ${landing_page_path} LIKE '%fbad%'
            THEN SPLIT_PART(SPLIT_PART(${landing_page_path},'fbad=',2),'&',1)
       ELSE NULL END ;;
  }

  dimension: utm_term {
    type: string
    sql:
      CASE WHEN ${landing_page_path} LIKE '%utm_term%'
            THEN SPLIT_PART(SPLIT_PART(${landing_page_path},'utm_term=',2),'&',1)
       ELSE NULL END ;;
  }

  dimension: utm_content {
    type: string
    sql:
      CASE WHEN ${landing_page_path} LIKE '%utm_content%'
            THEN SPLIT_PART(SPLIT_PART(${landing_page_path},'utm_content=',2),'&',1)
       ELSE NULL END ;;
  }

  dimension: utm_campaign {
    type: string
    sql:
      CASE WHEN ${landing_page_path} LIKE '%utm_campaign%'
            THEN SPLIT_PART(SPLIT_PART(${landing_page_path},'utm_campaign=',2),'&',1)
       ELSE NULL END ;;
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
    type: number
    sql: ${TABLE}.visit_duration ;;
  }

  measure: avg_session_duration {
    type: average
    sql: ${visit_duration} ;;
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
