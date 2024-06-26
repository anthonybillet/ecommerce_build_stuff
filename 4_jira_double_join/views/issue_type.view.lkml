view: issue_type {
  sql_table_name: `looker-private-demo.jira.issue_type` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: subtask {
    type: yesno
    sql: ${TABLE}.subtask ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
