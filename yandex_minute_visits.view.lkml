view: yandex_minute_visits {
  sql_table_name: site_visits.yandex_minute_visits ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${minute_of_visit_raw},referer_path_full_) ;;
  }
  dimension: refer_hash {
    type:  string
    sql: md5(CONCAT(${utm_campaign},${utm_medium}
        , ${utm_content},${utm_term}, ${utm_source})) ;;
  }

  dimension: java_script_present {
    type: string
    sql: ${TABLE}.java_script_present ;;
  }

  dimension_group: minute_of_visit {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.minute_of_visit ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: percentage_of_new_users_sessions {
    type: number
    sql: ${TABLE}.percentage_of_new_users_sessions ;;
  }

  dimension: presence_of_ad_blockers {
    type: string
    sql: ${TABLE}.presence_of_ad_blockers ;;
  }

  dimension: referer_path_full_ {
    type: string
    sql: ${TABLE}.referer_path_full_ ;;
  }

  dimension: decoded_path {
    type: string
    sql: decode_url_part(${referer_path_full_}) ;;
  }

  dimension: source {
    case: {
      when: {
        label: "facebook"
        sql: ${referrer_domain} iLIKE '%facebook%'
            OR  ${referrer_domain} iLIKE '%instagram%'
            OR ${utm_source} iLIKE 'facebook';;
      }
    }
  }

  dimension:  utm_source {
    sql:
      (CASE WHEN ${decoded_path} LIKE '%utm_source%'
            THEN SPLIT_PART(SPLIT_PART(${decoded_path},'utm_source=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension:  utm_content {
    sql:
      (CASE WHEN ${decoded_path} LIKE '%utm_content%'
            THEN SPLIT_PART(SPLIT_PART(${decoded_path},'utm_content=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension:  utm_term {
    sql:
      (CASE WHEN ${decoded_path} LIKE '%utm_term%'
            THEN SPLIT_PART(SPLIT_PART(${decoded_path},'utm_term=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension:  utm_campaign {
    sql:
      (CASE WHEN ${decoded_path} LIKE '%utm_campaign%'
            THEN SPLIT_PART(SPLIT_PART(${decoded_path},'utm_campaign=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension:  utm_medium {
    sql:
      (CASE WHEN ${decoded_path} LIKE '%utm_medium%'
            THEN SPLIT_PART(SPLIT_PART(${decoded_path},'utm_medium=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension: referrer_domain {
    type: string
    sql: ${TABLE}.referrer_domain ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: time_on_site {
    type: string
    sql: ${TABLE}.time_on_site ;;
  }

  dimension: users {
    type: number
    hidden:yes
    sql: ${TABLE}.users ;;
  }

  measure:  total_users {
    type: sum
    sql: ${users} ;;
  }
  measure: avg_time_on_site {
    type: average
    sql: ${time_on_site} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
