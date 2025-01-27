view: matches {
  #this view is based on the live google sheet hosted here:
  # https://docs.google.com/spreadsheets/d/1PVwSIep8q0m7s-4vfJmKya1DUyFVbIw1f1QzRqW40kA/edit?gid=0#gid=0

  sql_table_name: `ant-billet-looker-core-argolis.sample_data.matches` ;;

  dimension_group: date {
    label: "Match"
    type: time
    description: "%E4Y-%m-%d"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }
  dimension: loser {
    type: string
    sql: ${TABLE}.Loser ;;
  }
  dimension: match {
    type: number
    sql: ${TABLE}.Match ;;
  }
  dimension: winner {
    type: string
    sql: ${TABLE}.Winner ;;
  }
  measure: count {
    type: count
  }

  drill_fields: [match,winner,loser,date_date]
}
