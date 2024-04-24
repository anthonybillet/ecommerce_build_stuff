view: dates_table {
  derived_table: {
    sql:
--Generates date table with one row for every day
-- ends 2 years in the future and starts 5 years in the past
        SELECT date as any_date
        FROM UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(DATE_ADD(CURRENT_DATE, INTERVAL 2 YEAR), INTERVAL 7 YEAR), DATE_ADD(CURRENT_DATE, INTERVAL 2 YEAR))) date ;;
    persist_for: "24 hours"
  }

  dimension_group: any_date {
    type: time
    sql: ${TABLE}.any_date ;;
  }

}
