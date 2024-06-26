view: project {
  sql_table_name: `looker-private-demo.jira.project` ;;
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
  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: project_category_id {
    type: number
    sql: ${TABLE}.project_category_id ;;
  }
  dimension: project_type_key {
    type: string
    sql: ${TABLE}.project_type_key ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
