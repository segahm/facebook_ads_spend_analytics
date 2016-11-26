view: fb_insights {
  sql_table_name: facebook_ads.facebook_ads_insights_22273255 ;;
  dimension: pk {
    primary_key: yes
    sql: md5(CONCAT(${ad_id},${date_start_raw})) ;;
  }
  measure:  count {
    type: count
  }

#   dimension_group: _sdc_batched {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_batched_at ;;
#   }
#
#   dimension_group: _sdc_received {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_received_at ;;
#   }
#
#   dimension: _sdc_sequence {
#     type: number
#     sql: ${TABLE}._sdc_sequence ;;
#   }
#
#   dimension: _sdc_table_version {
#     type: number
#     sql: ${TABLE}._sdc_table_version ;;
#   }

#   dimension: account_id {
#     type: string
#     sql: ${TABLE}.account_id ;;
#   }
#
#   dimension: account_name {
#     type: string
#     sql: ${TABLE}.account_name ;;
#   }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  measure: earliest_action_date {
    type: date
    sql: MIN(${date_start_date}) ;;
  }

  measure: latest_action_date {
    type: date
    sql: MAX(${date_start_date}) ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    sql: ${TABLE}.adset_name ;;
  }

#   dimension: app_store_clicks {
#     type: number
#     sql: ${TABLE}.app_store_clicks ;;
#   }

  dimension: call_to_action_clicks {
    type: number
    sql: ${TABLE}.call_to_action_clicks ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

#   dimension: canvas_avg_view_percent {
#     type: number
#     sql: ${TABLE}.canvas_avg_view_percent ;;
#   }
#
#   dimension: canvas_avg_view_time {
#     type: number
#     sql: ${TABLE}.canvas_avg_view_time ;;
#   }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_inline_link_click {
    type: number
    sql: ${TABLE}.cost_per_inline_link_click ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    sql: ${TABLE}.cost_per_inline_post_engagement ;;
  }

  dimension: cost_per_total_action {
    type: number
    sql: ${TABLE}.cost_per_total_action ;;
  }

  dimension: cost_per_unique_click {
    type: number
    sql: ${TABLE}.cost_per_unique_click ;;
  }

  dimension: cost_per_unique_inline_link_click {
    type: number
    sql: ${TABLE}.cost_per_unique_inline_link_click ;;
  }

  dimension: cpc {
    type: number
    hidden: yes
    sql: ${TABLE}.cpc ;;
  }

  dimension: cpm {
    type: number
    hidden: yes
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    hidden: yes
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date_start {
    type: time
    timeframes: [date, week, month, raw]
    sql: ${TABLE}.date_start ;;
  }
#
#   dimension_group: date_stop {
#     type: time
#     timeframes: [time, date, week, month, raw]
#     sql: ${TABLE}.date_stop ;;
#   }

  dimension: deeplink_clicks {
    type: number
    sql: ${TABLE}.deeplink_clicks ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_link_click_ctr {
    type: number
    sql: ${TABLE}.inline_link_click_ctr ;;
  }

  dimension: inline_link_clicks {
    type: number
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    sql: ${TABLE}.inline_post_engagement ;;
  }

  dimension: newsfeed_avg_position {
    type: number
    sql: ${TABLE}.newsfeed_avg_position ;;
  }

  dimension: newsfeed_clicks {
    type: number
    sql: ${TABLE}.newsfeed_clicks ;;
  }

  dimension: newsfeed_impressions {
    type: number
    sql: ${TABLE}.newsfeed_impressions ;;
  }

#   dimension: objective {
#     type: string
#     sql: ${TABLE}.objective ;;
#   }

  dimension: reach {
    type: number
    hidden: yes
    sql: ${TABLE}.reach ;;
  }

  dimension: relevance_score__negative_feedback {
    type: string
    sql: ${TABLE}.relevance_score__negative_feedback ;;
  }

  dimension: relevance_score__positive_feedback {
    type: string
    sql: ${TABLE}.relevance_score__positive_feedback ;;
  }

  dimension: relevance_score__score {
    type: number
    sql: ${TABLE}.relevance_score__score ;;
  }

  dimension: relevance_score__status {
    type: string
    sql: ${TABLE}.relevance_score__status ;;
  }

  dimension: social_clicks {
    type: number
    sql: ${TABLE}.social_clicks ;;
  }

  dimension: social_impressions {
    type: number
    sql: ${TABLE}.social_impressions ;;
  }

  dimension: social_reach {
    type: number
    sql: ${TABLE}.social_reach ;;
  }

  dimension: social_spend {
    type: number
    sql: ${TABLE}.social_spend ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

#   dimension: total_action_value {
#     type: number
#     sql: ${TABLE}.total_action_value ;;
#   }

  dimension: actions {
    type: number
    hidden:  yes
    sql: ${TABLE}.total_actions ;;
  }

  dimension: total_unique_actions {
    type: number
    sql: ${TABLE}.total_unique_actions ;;
  }

  dimension: unique_clicks {
    type: number
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_ctr {
    type: number
    sql: ${TABLE}.unique_ctr ;;
  }

  dimension: unique_impressions {
    type: number
    sql: ${TABLE}.unique_impressions ;;
  }

  dimension: unique_inline_link_click_ctr {
    type: number
    sql: ${TABLE}.unique_inline_link_click_ctr ;;
  }

  dimension: unique_inline_link_clicks {
    type: number
    sql: ${TABLE}.unique_inline_link_clicks ;;
  }

  dimension: unique_link_clicks_ctr {
    type: number
    sql: ${TABLE}.unique_link_clicks_ctr ;;
  }

  dimension: unique_social_clicks {
    type: number
    sql: ${TABLE}.unique_social_clicks ;;
  }

  dimension: unique_social_impressions {
    type: number
    sql: ${TABLE}.unique_social_impressions ;;
  }

#   dimension: website_clicks {
#     type: number
#     sql: ${TABLE}.website_clicks ;;
#   }

#   AGGREGATED MEASURES
# AVOID website_clicks - seems off
#   measure: total_website_clicks {
#     type: sum
#     sql: ${website_clicks} ;;
#   }

  measure:  total_spend_on_clicks {
    type: sum
    value_format_name: usd_0
    sql: ${cpc}*${clicks}  ;;
  }

  measure: total_clicks {
    type:  sum
    sql: ${clicks} ;;
  }
  measure:  total_spend {
    value_format_name: usd_0
    type:  sum
    sql: ${spend} ;;
  }

  measure:  total_actions {
    type: sum
    sql: ${TABLE}.total_actions ;;
  }
  measure: avg_cpc {
    label: "Reported CPC"
    description: "average"
    value_format_name: usd
    type: number
    sql: ${total_spend_on_clicks} / NULLIF(${total_clicks},0) ;;
  }
  measure:  total_impressions {
    type: sum
    sql: ${impressions} ;;
  }
#
#   - measure: total_impressions
#     type: sum
#     sql: ${TABLE}.impressions
#
#   - measure: people_taking_action
#     description: The number of unique people who took an action such as liking your Page or installing your app as a result of your ad. For example, if the same person likes and comments on a post, they will be counted as 1 unique person.
#     type: sum
#     sql: ${TABLE}.total_unique_actions
#
#   - measure: total_inline_link_clicks
#     type: sum
#     sql: ${TABLE}.inline_link_clicks
#
# #### NOTE: you will need to use the frequency column that appears in your dataset.
#
#   - measure: avg_frequency
#     description: the average number of times your ad was served to each person
#     type: avg
#     sql: ${TABLE}.frequency
#
# #### NOTE: you will need to use the cpm column that appears in your dataset.
#
#   - measure: avg_cpm
#     description: The average cost you've paid to have 1,000 impressions on your ad.
#     type: avg
#     sql: ${TABLE}.cpm
#     value_format_name: usd
#
# #### NOTE: you will need to use the cpp column that appears in your dataset.
#
#   - measure: avg_cpp
#     description: The average cost you've paid to have your ad served to 1,000 unique people.
#     type: avg
#     sql: ${TABLE}.cpp
#     value_format_name: usd
#
# #### NOTE: you will need to use the spend column that appears in your dataset.
#
#   - measure: total_spend
#     type: sum
#     sql: ${TABLE}.spend
#     value_format_name: usd
#
# #### NOTE: you will need to use the ctr column that appears in your dataset.
#
#   - measure: avg_ctr
#     type: avg
#     sql: ${TABLE}.ctr
#
# #### NOTE: you will need to use the cpc column that appears in your dataset.
#
#   - measure: avg_cpc
#     type: avg
#     sql: ${TABLE}.cpc
#     value_format_name: usd
#
# #### NOTE: you will need to use the inline link click ctr column that appears in your dataset.
#
#   - measure: avg_inline_link_click_ctr
#     type: avg
#     sql: ${TABLE}.inline_link_click_ctr
#
# #### NOTE: you will need to use the cost per inline link click column that appears in your dataset.
#
#   - measure: avg_cost_per_inline_link_click
#     type: avg
#     sql: ${TABLE}.cost_per_inline_link_click

##########
}
