include: "/3_data_security_demo/views/**.view.lkml"

access_grant: customer_a_custom_fields {
  user_attribute: customer_group
  allowed_values: ["Customer_A","Admin"]
}

view: +order_items {

  dimension: customer_a_custom_1 {
    required_access_grants: [customer_a_custom_fields]
    type: string
    sql: CONCAT('Customer A','_', ${id})  ;;
  }

  dimension: customer_a_custom_2 {
    required_access_grants: [customer_a_custom_fields]
    type: string
    sql: CONCAT('Customer A','_', ${status})  ;;
  }

}

view: +users {

  dimension: customer_a_custom_1 {
    required_access_grants: [customer_a_custom_fields]
    type: string
    sql: CONCAT('Customer A','_', ${first_name});;
  }

  dimension: customer_a_custom_2 {
    required_access_grants: [customer_a_custom_fields]
    type: string
    sql: CONCAT('Customer A','_', ${last_name}) ;;
  }

}
