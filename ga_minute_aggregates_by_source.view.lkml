view: ga_minute_aggregates_by_source {
  derived_table: {
    sql: SELECT * FROM ga2petitefrance.report
      ;;
  }

  measure: count {
    type: count
  }

  dimension: date_hour {
    type: string
    sql: ${TABLE}.dateHour ;;
  }

  dimension: enddate {
    type: string
    sql: ${TABLE}."end-date" ;;
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: minute {
    type: string
    sql: ${TABLE}.minute ;;
  }

  dimension: new_visits {
    type: number
    sql: ${TABLE}.newVisits ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_medium {
    type: string
    sql: ${TABLE}.sourceMedium ;;
  }

  dimension: startdate {
    type: string
    sql: ${TABLE}."start-date" ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: visits {
    type: number
    sql: ${TABLE}.visits ;;
  }

}
