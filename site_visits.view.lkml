view: site_visits {
  derived_table: {
    sql:
      SELECT
      joindate AS first_visit_time
      , user_id::text AS id
      , 'heap' AS type
      , CASE
        WHEN initial_referrer LIKE '%facebook%' THEN 'facebook'
        WHEN initial_referrer LIKE '%instagram%' THEN 'facebook'
        END
        AS source
      FROM public.heap
      UNION ALL
      SELECT
      time_visit AS first_visit_time
      , md5(time_visit || traffic_sources || area) AS id
      , 'yandex' AS type
      , CASE
        WHEN traffic_sources = 'Facebook' THEN 'facebook'
        END
        AS source
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
    sql:
      (CASE WHEN ${type} = 'yandex' THEN ${yandex.visit_id}
      WHEN ${type} = 'heap' THEN ${heap.user_id}
      ELSE NULL
      END);;
  }
  measure: facebook_visits {
    type:  count_distinct
    filters: {
      field: source
      value: "facebook"
    }
    sql:
    (CASE WHEN ${type} = 'yandex' THEN ${yandex.visit_id}
    WHEN ${type} = 'heap' THEN ${heap.user_id}
    ELSE NULL
    END);;
  }
}
