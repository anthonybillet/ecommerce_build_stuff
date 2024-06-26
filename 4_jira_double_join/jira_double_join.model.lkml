connection: "argolis"

include: "/4_jira_double_join/views/**.view.lkml"

label: "Z) Jira Double Join"


# explore: issue {
#   join: user {
#     sql_on: ${issue.reporter} = ${user.id} ;;
#   }
# }

explore: issue {
  join: reporter {
    view_label: "Reporter"
    from: user
    sql_on: ${issue.reporter_id} = ${reporter.id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: assignee {
    view_label: "Assignee"
    from: user
    sql_on: ${issue.assignee_id} = ${assignee.id} ;;
    type: left_outer
    relationship: many_to_one
  }

  label: "Jira Issues"
  view_label: " Issue"

  always_filter: {
    filters: [issue.is_assigned: "Yes", issue.created_date: "last 90 days"]
  }
}
