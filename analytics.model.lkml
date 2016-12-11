connection: "my_ad_analytics"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"
explore: yandex_minute_visits {}

explore: ga_sources_utm {}


explore: site_visits {

  join: heap {
    type: left_outer
    view_label: "heap"
    relationship: many_to_one
    sql_on: ${site_visits.id} = ${heap.user_id}
      AND ${site_visits.type} = 'heap';;
  }
  join: yandex {
    type: left_outer
    view_label: "yandex"
    relationship: many_to_one
    sql_on: ${site_visits.id} = ${yandex.visit_id}
      AND ${site_visits.type} = 'yandex';;
  }
}

explore:  facebook {
  view_name: fb_ads
  from:  fb_ads
#   sql_always_where:
#     ${ga_geo.country} = 'United States' OR
#     ${ga_geo.country} IS NULL;;
#   join: calendar {
#     type:  inner
#     relationship:  many_to_many
#     sql_on:  ${calendar.at_raw} BETWEEN
#       ${fb_insights.date_start_raw}
#       AND
#
#   }

  join:  fb_adset{
    relationship:  many_to_one
    sql_on: ${fb_ads.adset_id} = ${fb_adset.id};;
  }
  join:  fb_campaign {
    relationship:  many_to_one
    sql_on: ${fb_ads.campaign_id} = ${fb_campaign.id} ;;
  }
  join:  fb_targeting_geo {
    view_label: "Target Location"
    relationship: one_to_many
    sql_on: ${fb_adset.id} = ${fb_targeting_geo._sdc_source_key_id} ;;
  }
  join: fb_insights {
    relationship:  one_to_many
    sql_on: ${fb_adset.id} = ${fb_insights.adset_id};;
  }

  join:  campaign_actions {
    view_label: "Fb Campaign"
    relationship: one_to_one
    sql_on: ${fb_campaign.id} = ${campaign_actions.campaign_id} ;;
  }

  join:  fb_insights_actions {
    relationship: one_to_many
    sql_on:  ${fb_insights.pk} = ${fb_insights_actions.insight_id} ;;
  }
  join: fb_creative {
    relationship:  many_to_one
    sql_on: ${fb_ads.creative__id} = ${fb_creative.id} ;;
  }
  join: heap {
    type: left_outer
    view_label: "UTM Traffic (Heap)"
    relationship: many_to_many
    sql_on:
      ${heap.initial_utm_source} = 'facebook'
      AND
      ${fb_creative.utm_campaign} = ${heap.initial_utm_campaign}
      AND
      ${fb_insights.observation_date} = ${heap.joindate_date}
      ;;
  }

  join:  ga_sources_utm {
    view_label: "UTM Traffic (Google)"
    type:  left_outer
    relationship: many_to_many
    sql_on:
      ${ga_sources_utm.source} = 'facebook'
      AND
      ${fb_creative.utm_campaign} = ${ga_sources_utm.campaign}
      AND
      ${fb_insights.observation_date} = ${ga_sources_utm.start_date};;
#   AND ${fb_creative.utm_medium} = ${ga_sources_utm.medium}
  }

  join: yandex_utm {
    view_label: "UTM Traffic (Yandex)"
    from: yandex_minute_visits
    relationship: many_to_many
    sql_on:
      ${yandex_utm.source} = 'facebook'
      AND
      ${fb_creative.utm_campaign} = ${yandex_utm.utm_campaign}
      AND
      ${fb_insights.observation_date} = ${yandex_utm.minute_of_visit_date};;
#       AND
#       ${fb_creative.utm_medium} = ${yandex_utm.utm_medium}
#       AND
#       ${fb_creative.utm_content} = ${yandex_utm.utm_content};;
#       AND
#       ${fb_creative.utm_term} = ${yandex_utm.utm_term};;
#       ;;
  }


#   join:  ga_geo {
#     type: inner
#     relationship: many_to_many
#     sql_on: ${ga_traffic_sources.date_hour_raw} = ${ga_geo.date_hour_raw} ;;
#   }


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
