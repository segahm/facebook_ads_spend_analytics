view: facebook {
  sql_table_name: public.facebook ;;

  dimension: actions {
    type: number
    sql: ${TABLE}.actions ;;
  }

  dimension: ad_set_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.ad_set_id ;;
  }

  dimension: ad_set_name {
    type: string
    sql: ${TABLE}.ad_set_name ;;
  }

  dimension: amount_spent {
    type: number
    sql: ${TABLE}.amount_spent ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_result {
    type: number
    sql: ${TABLE}.cost_per_result ;;
  }

  dimension: cost_per_website_action {
    type: number
    sql: ${TABLE}.cost_per_website_action ;;
  }

  dimension: costs_per_all_actions {
    type: number
    sql: ${TABLE}.costs_per_all_actions ;;
  }

  dimension_group: ends {
    type: time
    timeframes: [date, week, month, raw]
    convert_tz: no
    sql: ${TABLE}.ends ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }
  measure:  total_impressions {
    type:  sum
    sql: ${impressions} ;;
  }

  dimension: link_clicks {
    type: number
    sql: ${TABLE}.link_clicks ;;
  }

  measure:  total_link_clicks {
    type:  sum
    sql:  ${link_clicks} ;;
  }
  dimension: page_engagement {
    type: number
    sql: ${TABLE}.page_engagement ;;
  }

  measure:  total_page_engagement {
    type:  sum
    sql:  ${page_engagement} ;;
  }

  dimension: page_likes {
    type: number
    sql: ${TABLE}.page_likes ;;
  }

  measure:  total_page_likes {
    type:  sum
    sql:  ${page_likes} ;;

  }

  dimension: people_taking_action {
    type: number
    sql: ${TABLE}.people_taking_action ;;
  }

  measure:  total_people_taking_action {
    type:  sum
    sql:  ${people_taking_action} ;;
  }

  dimension: photo_views {
    type: number
    sql: ${TABLE}.photo_views ;;
  }

  measure:  total_photo_views {
    type:  sum
    sql:  ${photo_views};;
  }

  dimension: post_comments {
    type: number
    sql: ${TABLE}.post_comments ;;
  }

  measure: total_post_comments   {
    type:  sum
    sql:  ${post_comments} ;;
  }

  dimension: post_engagement {
    type: number
    sql: ${TABLE}.post_engagement ;;
  }

  measure:  total_post_engagement {
    type:  sum
    sql:  ${post_engagement} ;;
  }

  dimension: post_reactions {
    type: number
    sql: ${TABLE}.post_reactions ;;
  }

  measure:  total_post_reactions {
    type:  sum
    sql:  ${post_reactions} ;;
  }

  dimension: post_shares {
    type: number
    sql: ${TABLE}.post_shares ;;
  }

  measure:  total_post_shares {
    type:  sum
    sql:  ${post_shares} ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  measure:  total_reach {
    type:  sum
    sql:  ${reach} ;;
  }

  dimension: result_type {
    type: string
    sql: ${TABLE}.result_type ;;
  }

  dimension: results {
    type: number
    sql: ${TABLE}.results ;;
  }

  measure:  total_results {
    type:  sum
    sql:  ${results} ;;
  }

  dimension: social_clicks {
    type: number
    sql: ${TABLE}.social_clicks ;;
  }

  dimension_group: starts {
    type: time
    timeframes: [date, week, month,raw]
    convert_tz: no
    sql: ${TABLE}.starts ;;
  }

  dimension: unique_clicks {
    type: number
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_clicks_to_link {
    type: number
    sql: ${TABLE}.unique_clicks_to_link ;;
  }

  dimension: unique_social_clicks {
    type: number
    sql: ${TABLE}.unique_social_clicks ;;
  }

  dimension: website_actions {
    type: number
    sql: ${TABLE}.website_actions ;;
  }

  measure: count {
    type: count
    drill_fields: [ad_set_name]
  }

  measure:  total_amount_spent {
    type: sum
    hidden:  yes
    sql: ${amount_spent} ;;
  }
  measure:  total_daily_spent {
    sql: ${total_amount_spent} / NULLIF(${calendar.count_days},0) ;;
  }
  measure:  total_unique_clicks{
    type:  sum
    sql:  ${unique_clicks} ;;
  }

  measure: actual_cost_per_visit {
    sql: ${total_daily_spent} / NULLIF(${site_visits.facebook_visits},0);;
  }

}
