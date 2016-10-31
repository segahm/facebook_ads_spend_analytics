view: calendar  {
  derived_table: {
    sql:
      SELECT GENERATE_SERIES('2016-06-01', CURRENT_DATE, '1 day')::DATE AS date;;
  }
  dimension:  pk {
    primary_key: yes
    sql:  ${TABLE}.date ;;
  }
  dimension_group: at {
    type: time
    datatype: date
    timeframes: [date,raw,month]
    sql:  ${TABLE}.date ;;
  }
  measure:  count_days {
    type:  count
  }
}
