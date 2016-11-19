connection: "my_ad_analytics"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


explore:  facebook {
  view_name: fb_insights
  from:  fb_insights
#   join: calendar {
#     type:  inner
#     relationship:  many_to_many
#     sql_on:  ${calendar.at_raw} BETWEEN
#       ${fb_insights.date_start_raw}
#       AND
#
#   }

  join:  fb_insights_actions {
    relationship: one_to_many
    sql_on:  ${fb_insights.pk} = ${fb_insights_actions.insight_id} ;;
  }
  join: fb_ads {
    relationship:  many_to_one
    sql_on: ${fb_insights.ad_id} = ${fb_ads.id} ;;
  }
  join: fb_creative {
    relationship:  one_to_one
    sql_on: ${fb_ads.creative__id} = ${fb_creative.id} ;;
  }
#   join:  fb_conversion_specs {
#     relationship: one_to_one
#     sql_on: ${fb_ads.id} =
#   }
#   join:  fb_conversion_type {
#     view_label: "Fb Conversion Specs"
#     relationship: one_to_one
#     sql_on:  ${fb_conversion_specs._sdc_source_key_id} = ${fb_conversion_type._sdc_source_key_id};;
#   }
}

# explore:  facebook {
#   join: calendar {
#     type:  inner
#     relationship:  many_to_many
#     sql_on:  ${calendar.at_raw} BETWEEN
#       ${facebook.starts_raw}
#       AND
#       ${facebook.ends_raw};;
#   }
# }

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

}
