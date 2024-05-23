connection: "argolis"

include: "/3_data_security_demo/views/*.view.lkml"

label: "3) Data Security Demo"

access_grant: can_see_sensitive_data {
  user_attribute: can_see_sensitive_data
  allowed_values: ["Yes"]
}

explore: order_items {
  label: "Orders, Items and Users (Data Security)"
  view_name: order_items

  access_filter: {
    user_attribute: customer_id
    field: products.brand
  }

  join: distribution_centers {
    view_label: "Distribution Center"
    type: left_outer
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    view_label: "Inventory Items"
    #Left Join only brings in items that have been sold as order_item
    type: full_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
  }

  join: users {
    view_label: "Users"
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  join: products {
    view_label: "Products"
    type: left_outer
    relationship: many_to_one
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
  }
}
