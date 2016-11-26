view: fb_insights_actions {
  derived_table: {
#     persist_for: "120 hours"
    sql:
      WITH dt AS (SELECT
        action_target_id
        , _sdc_source_key_ad_id
        , _sdc_source_key_date_start
        , value
        , ARRAY_TO_STRING(ARRAY(SELECT unnest(array_agg(DISTINCT fb_insights_actions.action_type )) ORDER BY 1),'|') AS actions
      FROM facebook_ads.facebook_ads_insights_22273255__actions AS fb_insights_actions
      GROUP BY 1, 2, 3, 4
      )

      SELECT
      ROW_NUMBER() OVER () AS pk
      , *
      FROM dt
      ;;
  }

  dimension:  pk {
    sql:  ${TABLE}.pk ;;
    primary_key: yes
  }
#   dimension:  pk {
#     primary_key: yes
#     hidden:  yes
#     sql:  md5(CONCAT(
#       ${action_target_id}
#       ,${action_type}
#       ,${_sdc_source_key_ad_id}
#       ,${_sdc_source_key_date_start_raw}));;
#   }
  dimension:  insight_id {
    hidden:  yes
    sql:  md5(CONCAT(
      ${_sdc_source_key_ad_id}
      ,${_sdc_source_key_date_start_raw}));;
  }
#
#   dimension: 1d_click {
#     type: number
#     sql: ${TABLE}.1d_click ;;
#   }
#
#   dimension: 1d_view {
#     type: number
#     sql: ${TABLE}.1d_view ;;
#   }
#
#   dimension: 28d_click {
#     type: number
#     sql: ${TABLE}.28d_click ;;
#   }
#
#   dimension: 28d_view {
#     type: number
#     sql: ${TABLE}.28d_view ;;
#   }
#
#   dimension: 7d_click {
#     type: number
#     sql: ${TABLE}.7d_click ;;
#   }
#
#   dimension: 7d_view {
#     type: number
#     sql: ${TABLE}.7d_view ;;
#   }

#   dimension_group: _sdc_batched {
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}._sdc_batched_at ;;
#   }
#
#   dimension: _sdc_level_0_id {
#     type: number
#     sql: ${TABLE}._sdc_level_0_id ;;
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

  dimension: _sdc_source_key_ad_id {
    type: string
    sql: ${TABLE}._sdc_source_key_ad_id ;;
  }

#   dimension: _sdc_source_key_adset_id {
#     type: string
#     sql: ${TABLE}._sdc_source_key_adset_id ;;
#   }
#
#   dimension: _sdc_source_key_campaign_id {
#     type: string
#     sql: ${TABLE}._sdc_source_key_campaign_id ;;
#   }

  dimension_group: _sdc_source_key_date_start {
    type: time
    hidden:  yes
    timeframes: [date, raw, time]
    sql: ${TABLE}._sdc_source_key_date_start ;;
  }

#   dimension: _sdc_table_version {
#     type: number
#     sql: ${TABLE}._sdc_table_version ;;
#   }

#   dimension: action_destination {
#     type: string
#     sql: ${TABLE}.action_destination ;;
#   }

  dimension: action_target_id {
    type: string
    sql: ${TABLE}.action_target_id ;;
  }

  dimension: actions {
    type: string
    sql: ${TABLE}.actions ;;
  }
#   dimension: action {
#     type:  string
#     sql:  string_to_array(${actions},'|','|RECORD|') ;;
#   }

  measure: all_actions {
    type: list
    list_field: actions
  }
  dimension:  is_link_click {
    type: yesno
    sql: ${actions} LIKE '%link_click%' ;;
  }

  dimension:  is_like{
    type: yesno
    sql: ${actions} LIKE '%like%';;
  }

  dimension:  is_engagement{
    type: yesno
    sql: ${actions} LIKE '%engagement%';;
  }

  dimension:  is_post{
    type: yesno
    sql: ${actions} LIKE '%post%';;
  }

  measure:  total_engagement {
    sql: ${value} ;;
    type:  sum
    filters: {
      field: is_engagement
      value: "yes"
    }
  }

  measure:  total_posts {
    sql: ${value} ;;
    type:  sum
    filters: {
      field: is_post
      value: "yes"
    }
  }

  dimension: value {
    type: number
#     hidden:  yes
    sql: ${TABLE}.value ;;
  }
  measure:  total_link_clicks {
    sql: ${value} ;;
    type:  sum
    filters: {
      field: is_link_click
      value: "yes"
    }
  }

  measure:  total_likes {
    sql: ${value} ;;
    type:  sum
    filters: {
      field: is_like
      value: "yes"
    }
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
