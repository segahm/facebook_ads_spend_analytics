view: adwords {
  derived_table: {
    sql: SELECT * FROM wwwpetitefrancexyz_all_web_site_data.campaigns125444811_v2
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: _sdc_batched_at {
    type: string
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension: _sdc_received_at {
    type: string
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.accountId ;;
  }

  dimension: ad_clicks {
    type: number
    sql: ${TABLE}.adClicks ;;
  }

  dimension: ad_cost {
    type: number
    sql: ${TABLE}.adCost ;;
  }

  dimension: adwords_campaign_id {
    type: string
    sql: ${TABLE}.adwordsCampaignID ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profileId ;;
  }

  dimension: profile_name {
    type: string
    sql: ${TABLE}.profileName ;;
  }

  set: detail {
    fields: [_sdc_batched_at, _sdc_received_at, _sdc_sequence, _sdc_table_version, account_id, ad_clicks, ad_cost, adwords_campaign_id, campaign, date, impressions, profile_id, profile_name]
  }
}
