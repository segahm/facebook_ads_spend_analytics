view: fb_creative {
  sql_table_name: facebook_ads.facebook_adcreative_22273255 ;;

  dimension: id {
    primary_key: yes
    hidden:  yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: ad_hash {
    type:  string
    sql: md5(CONCAT(
      ${utm_campaign}
      ,${utm_medium}
      , ${utm_content}
      ,${utm_term}
      ,${utm_source})) ;;
  }

  dimension:  utm_medium {
    sql:
      (CASE WHEN ${url_tags} LIKE '%utm_medium%'
            THEN SPLIT_PART(SPLIT_PART(${url_tags},'utm_medium=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension:  utm_source {
    sql:
      (CASE WHEN ${url_tags} LIKE '%utm_source%'
            THEN SPLIT_PART(SPLIT_PART(${url_tags},'utm_source=',2),'&',1)
       ELSE '' END) ;;
  }
  dimension:  utm_term {
    sql:
      (CASE WHEN ${url_tags} LIKE '%utm_term%'
            THEN SPLIT_PART(SPLIT_PART(${url_tags},'utm_term=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension:  utm_campaign {
    sql:
      (CASE WHEN ${url_tags} LIKE '%utm_campaign%'
            THEN SPLIT_PART(SPLIT_PART(${url_tags},'utm_campaign=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension:  utm_content {
    sql:
      (CASE WHEN ${url_tags} LIKE '%utm_content%'
            THEN SPLIT_PART(SPLIT_PART(${url_tags},'utm_content=',2),'&',1)
       ELSE '' END) ;;
  }

  dimension: link_url {
    type: string
    sql: ${TABLE}.link_url ;;
  }

  dimension: url_tags {
    type: string
    sql: ${TABLE}.url_tags ;;
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
#
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
#
#   dimension: body {
#     type: string
#     sql: ${TABLE}.body ;;
#   }
#
#   dimension: call_to_action_type {
#     type: string
#     sql: ${TABLE}.call_to_action_type ;;
#   }
#
#   dimension: image_hash {
#     type: string
#     sql: ${TABLE}.image_hash ;;
#   }
#
#   dimension: image_url {
#     type: string
#     sql: ${TABLE}.image_url ;;
#   }
#
#   dimension: object_id {
#     type: string
#     sql: ${TABLE}.object_id ;;
#   }
#
#   dimension: object_story_id {
#     type: string
#     sql: ${TABLE}.object_story_id ;;
#   }
#
#   dimension: object_story_spec__instagram_actor_id {
#     type: string
#     sql: ${TABLE}.object_story_spec__instagram_actor_id ;;
#   }
#
#   dimension: object_story_spec__link_data__attachment_style {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__attachment_style ;;
#   }
#
#   dimension: object_story_spec__link_data__call_to_action__type {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__call_to_action__type ;;
#   }
#
#   dimension: object_story_spec__link_data__call_to_action__value__link {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__call_to_action__value__link ;;
#   }
#
#   dimension: object_story_spec__link_data__caption {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__caption ;;
#   }
#
#   dimension: object_story_spec__link_data__description {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__description ;;
#   }
#
#   dimension: object_story_spec__link_data__event_id {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__event_id ;;
#   }
#
#   dimension: object_story_spec__link_data__image_hash {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__image_hash ;;
#   }
#
#   dimension: object_story_spec__link_data__link {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__link ;;
#   }
#
#   dimension: object_story_spec__link_data__message {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__message ;;
#   }
#
#   dimension: object_story_spec__link_data__multi_share_end_card {
#     type: yesno
#     sql: ${TABLE}.object_story_spec__link_data__multi_share_end_card ;;
#   }
#
#   dimension: object_story_spec__link_data__multi_share_optimized {
#     type: yesno
#     sql: ${TABLE}.object_story_spec__link_data__multi_share_optimized ;;
#   }
#
#   dimension: object_story_spec__link_data__url {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__name ;;
#   }
#
#   dimension: object_story_spec__link_data__picture {
#     type: string
#     sql: ${TABLE}.object_story_spec__link_data__picture ;;
#   }
#
#   dimension: object_story_spec__page_id {
#     type: string
#     sql: ${TABLE}.object_story_spec__page_id ;;
#   }
#
#   dimension: object_story_spec__photo_data__caption {
#     type: string
#     sql: ${TABLE}.object_story_spec__photo_data__caption ;;
#   }
#
#   dimension: object_story_spec__photo_data__image_hash {
#     type: string
#     sql: ${TABLE}.object_story_spec__photo_data__image_hash ;;
#   }
#
#   dimension: object_story_spec__video_data__call_to_action__type {
#     type: string
#     sql: ${TABLE}.object_story_spec__video_data__call_to_action__type ;;
#   }
#
#   dimension: object_story_spec__video_data__call_to_action__value__link {
#     type: string
#     sql: ${TABLE}.object_story_spec__video_data__call_to_action__value__link ;;
#   }
#
#   dimension: object_story_spec__video_data__call_to_action__value__page {
#     type: string
#     sql: ${TABLE}.object_story_spec__video_data__call_to_action__value__page ;;
#   }
#
#   dimension: object_story_spec__video_data__description {
#     type: string
#     sql: ${TABLE}.object_story_spec__video_data__description ;;
#   }
#
#   dimension: object_story_spec__video_data__image_url {
#     type: string
#     sql: ${TABLE}.object_story_spec__video_data__image_url ;;
#   }
#
#   dimension: object_story_spec__video_data__video_id {
#     type: string
#     sql: ${TABLE}.object_story_spec__video_data__video_id ;;
#   }
#
#   dimension: object_url {
#     type: string
#     sql: ${TABLE}.object_url ;;
#   }
#
#   dimension: title {
#     type: string
#     sql: ${TABLE}.title ;;
#   }
#
#   dimension: url_tags {
#     type: string
#     sql: ${TABLE}.url_tags ;;
#   }

  measure: count {
    type: count
  }
}
