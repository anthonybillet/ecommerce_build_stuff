include: "/z_looker_partner_exam_dev/Q2.10.04/**.view.lkml"

# # Answer A (Correct)
# explore: chats {
#   join: customers {
#     from: users
#     relationship: many_to_one
#     sql_on: ${chats.customer_id} = ${customers.user_id} ;;
#   }
#   join: agent_employees {
#     from: users
#     relationship: many_to_one
#     sql_on: ${chats.agent_employee_id} = ${customers.user_id} ;;
#   }
# }

# # Answer B (Incorrect)
# explore: chats {
#   join: users {
#     relationship: many_to_many
#     sql_on: ${chats.customer_id} = ${users.user_id} AND ${chats.agent_employee_id} = ${users.user_id} ;;
#   }
# }

# # Answer C (Incorrect)
# explore: chats {
#   join: users {
#     view_label: "Customers"
#     relationship: many_to_one
#     sql_on: ${chats.customer_id} = ${users.user_id} ;;
#   }
#   join: users {
#     view_label: "Users"
#     from: users
#     relationship: many_to_one
#     sql_on: ${chats.agent_employee_id} = ${users.user_id} ;;
#   }
# }

# Answer D (Incorrect)
# explore: chats {
#   join: customers {
#     from: users
#     relationship: one_to_one
#     sql_on: ${chats.customer_id} = ${customers.user_id} ;;
#   }
#   join: agent_employees {
#     from: users
#     relationship: one_to_one
#     sql_on: ${chats.agent_employee_id} = ${customers.user_id} ;;
#   }
# }
