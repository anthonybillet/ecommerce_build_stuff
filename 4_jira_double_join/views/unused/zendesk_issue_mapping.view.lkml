view: zendesk_issue_mapping {
  sql_table_name: `looker-private-demo.jira.zendesk_issue_mapping` ;;

  dimension: jira_issue_id {
    type: number
    sql: ${TABLE}.jira_issue_id ;;
  }
  dimension: zendesk_ticket_id {
    type: string
    sql: ${TABLE}.zendesk_ticket_id ;;
  }
  measure: count {
    type: count
  }
}
