view: user {
  sql_table_name: `looker-private-demo.jira.user` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, username]
  }
}
