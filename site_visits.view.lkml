view: site_visits {
  derived_table: {
    sql:
      SELECT
        "dateHour" AS first_visit_time
        , _rjm_record_hash AS id
        , 'google' AS type
        , CASE
          WHEN source iLIKE 'facebook'
                OR report."socialNetwork" iLIKE 'facebook'
                OR report."sourceMedium" iLIKE 'facebook'
          THEN 'facebook'
          END AS source
      FROM traffic_sources.report
      UNION ALL
      SELECT
      joindate AS first_visit_time
      , user_id::text AS id
      , 'heap' AS type
      , CASE
        WHEN initial_referrer LIKE '%facebook%'
              OR initial_referrer LIKE '%instagram%'
              OR initial_utm_source iLIKE 'facebook' THEN 'facebook'
        END AS source
      FROM public.heap
      UNION ALL
      SELECT
      time_visit AS first_visit_time
      , md5(time_visit || traffic_sources || area) AS id
      , 'yandex' AS type
      , CASE
        WHEN traffic_sources = 'Facebook'
              OR utm_source iLIKE 'facebook' THEN 'facebook'
        END AS source
      FROM public.yandex;;
  }
  dimension: id {
    hidden: yes
    primary_key: yes
  }
  dimension_group: first_visit {
    type: time
    timeframes: [time,date,week,day_of_week,day_of_month,raw]
    sql: ${TABLE}.first_visit_time ;;
  }
  dimension: type {
#     hidden: yes
  }
  dimension: source {

  }
  measure: count {
    type:  count_distinct
    label: "Non-unique Count"
    sql:
      (CASE WHEN ${type} = 'yandex' THEN ${yandex.visit_id}
      WHEN ${type} = 'heap' THEN ${heap.user_id}
      WHEN ${type} = 'google' THEN ${ga_traffic_sources._rjm_record_hash}
      ELSE NULL
      END);;
  }
#   measure: facebook_visits {
#     type:  count_distinct
#     filters: {
#       field: source
#       value: "facebook"
#     }
#     sql:
#     (CASE WHEN ${type} = 'yandex' THEN ${yandex.visit_id}
#     WHEN ${type} = 'heap' THEN ${heap.user_id}
#     ELSE NULL
#     END);;
#   }
}
