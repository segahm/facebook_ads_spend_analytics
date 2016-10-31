connection: "my_ad_analytics"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore:  site_visits {
  join: heap {
    type: left_outer
    relationship: one_to_one
    sql_on: ${site_visits.id} = ${heap.user_id}
    AND ${site_visits.type} = 'heap';;
  }
  join: yandex {
    type: left_outer
    relationship: one_to_one
    sql_on: ${site_visits.id} = ${yandex.visit_id}
    AND ${site_visits.type} = 'yandex';;
  }
  join: calendar {
    type:  inner
    relationship:  many_to_one
    sql_on:  ${site_visits.first_visit_date} = ${calendar.at_raw};;
  }

  join: facebook {
    type: left_outer
    relationship: many_to_many
    sql_on:
      (${site_visits.first_visit_raw}
      BETWEEN
      ${facebook.starts_raw}
      AND
      ${facebook.ends_raw})
      AND ${site_visits.source} = 'facebook'
    ;;
  }
}
