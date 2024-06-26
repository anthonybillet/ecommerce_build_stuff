view: status {
  sql_table_name: `looker-private-demo.jira.status` ;;
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
  dimension: status_category_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.status_category_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, status_category.name, status_category.id]
  }
}
