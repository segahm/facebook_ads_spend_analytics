view: campaign_actions {
  derived_table: {
    persist_for: "360 hours"
    indexes: ["campaign_id"]
    sql:
     SELECT
        fb_insights.campaign_id AS campaign_id
        , ARRAY_TO_STRING(ARRAY(SELECT unnest(array_agg(DISTINCT action_type )) ORDER BY 1),'|') AS actions
      FROM facebook_ads.facebook_ads_insights_22273255 AS fb_insights
      INNER JOIN facebook_ads.facebook_ads_insights_22273255__actions AS fb_insights_actions
        ON (md5(CONCAT(fb_insights.ad_id,fb_insights.date_start)))
          = (md5(CONCAT(
              fb_insights_actions._sdc_source_key_ad_id
              ,fb_insights_actions._sdc_source_key_date_start)))
      WHERE
        value IS NOT NULL
      GROUP BY 1;;
  }

  dimension: actions {}
  dimension: campaign_id {
    hidden: yes
  }
}

view: fb_campaign {
  sql_table_name: facebook_ads.facebook_campaigns_22273255 ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

#   dimension: ads__paging__cursors__after {
#     type: string
#     sql: ${TABLE}.ads__paging__cursors__after ;;
#   }
#
#   dimension: ads__paging__cursors__before {
#     type: string
#     sql: ${TABLE}.ads__paging__cursors__before ;;
#   }

  dimension: buying_type {
    type: string
    sql: ${TABLE}.buying_type ;;
  }

  dimension: effective_status {
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: names {
    type: list
    list_field: name
  }

  dimension: objective {
    type: string
    sql: ${TABLE}.objective ;;
  }

  dimension: is_objective_like {
    type: yesno
    sql: ${objective} = 'PAGE_LIKES' ;;
  }


  measure: count {
    type: count
    drill_fields: [id
      , name
      , objective
      , fb_insights_actions.all_actions
      , fb_insights.total_spend
      , fb_insights.earliest_action_date
      , fb_insights.latest_action_date
    ]
  }
}
