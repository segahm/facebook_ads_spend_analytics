view: yandex_trimmed2 {
  sql_table_name: site_visits.yandex_trimmed2 ;;

  dimension: _area_ {
    type: string
    sql: ${TABLE}._area_ ;;
  }

  dimension_group: date_of_first_visit {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.date_of_first_visit ;;
  }

  dimension: path {
    type: string
    sql: decode_url_part('/l.php?u=http:%2F%2Fwww.petitefrance.xyz%2Fpetits-ateliers.html%3Futm_source%3Dfacebook%26utm_medium%3Dcpm%26utm_campaign%3Dthree_events%26utm_term%3Dad2&amp;h=4c33tTFV9') ;;
  }

  dimension:  utm_medium {
    sql:
      CASE WHEN ${path} LIKE '%utm_campaign%'
            THEN SPLIT_PART(SPLIT_PART(${path},'utm_campaign=',2),'&',1)
       ELSE NULL END ;;
  }

  dimension: java_script_present {
    type: string
    sql: ${TABLE}.java_script_present ;;
  }

  dimension: landing_page_path_full_ {
    type: string
    sql: ${TABLE}.landing_page_path_full_ ;;
  }

  dimension_group: minute_of_visit {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.minute_of_visit ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.page_views ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: time_on_site {
    type: string
    sql: ${TABLE}.time_on_site ;;
  }

  dimension: traffic_source_detailed_ {
    type: string
    sql: ${TABLE}.traffic_source_detailed_ ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
