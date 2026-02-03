view: ecomm_denormalized {
  sql_table_name: `ant-billet-looker-core-argolis.thelook_ecomm.ecomm_denormalized` ;;

  dimension_group: delivered {
    view_label: "Order Item"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: inventory_item_cost {
    view_label: "Inventory Item"
    type: number
    sql: ${TABLE}.inventory_item_cost ;;
  }
  dimension_group: inventory_item_created {
    view_label: "Inventory Item"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.inventory_item_created_at ;;
  }
  dimension: inventory_item_id {
    view_label: "Inventory Item"
    primary_key: yes
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension_group: inventory_item_sold {
    view_label: "Inventory Item"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.inventory_item_sold_at ;;
  }
  dimension_group: order_created {
    view_label: "Order Item"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.order_created_at ;;
  }
  dimension: order_id {
    view_label: "Order Item"
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: order_item_id {
    view_label: "Order Item"
    type: number
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: order_status {
    view_label: "Order Item"
    type: string
    sql: ${TABLE}.order_status ;;
  }
  dimension: product_brand {
    view_label: "Product"
    type: string
    sql: ${TABLE}.product_brand ;;
  }
  dimension: product_category {
    view_label: "Product"
    type: string
    sql: ${TABLE}.product_category ;;
  }
  dimension: product_department {
    view_label: "Product"
    type: string
    sql: ${TABLE}.product_department ;;
  }
  dimension: product_distribution_center_id {
    view_label: "Product"
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }
  dimension: product_id {
    view_label: "Product"
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    view_label: "Product"
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: product_retail_price {
    view_label: "Product"
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }
  dimension: product_sku {
    view_label: "Product"
    type: string
    sql: ${TABLE}.product_sku ;;
  }
  dimension_group: returned {
    view_label: "Order Item"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    view_label: "Order Item"
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension_group: shipped {
    view_label: "Order Item"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: user_age {
    view_label: "User"
    type: number
    sql: ${TABLE}.user_age ;;
  }
  dimension: user_city {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_city ;;
  }
  dimension: user_country {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_country ;;
  }
  dimension_group: user_created {
    view_label: "User"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_created_at ;;
  }
  dimension: user_email {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_email ;;
  }
  dimension: user_first_name {
    hidden: yes
    view_label: "User"
    type: string
    sql: ${TABLE}.user_first_name ;;
  }
  dimension: user_name {
    view_label: "User"
    type: string
    sql: CONCAT(${user_first_name}, ' ', ${user_last_name} ;;
  }
  dimension: user_gender {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_gender ;;
  }
  dimension: user_geom {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_geom ;;
  }
  dimension: user_id {
    view_label: "User"
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension: user_last_name {
    hidden: yes
    view_label: "User"
    type: string
    sql: ${TABLE}.user_last_name ;;
  }
  dimension: user_latitude {
    view_label: "User"
    type: number
    sql: ${TABLE}.user_latitude ;;
  }
  dimension: user_longitude {
    view_label: "User"
    type: number
    sql: ${TABLE}.user_longitude ;;
  }
  dimension: user_postal_code {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_postal_code ;;
  }
  dimension: user_state {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_state ;;
  }
  dimension: user_street_address {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_street_address ;;
  }
  dimension: user_traffic_source {
    view_label: "User"
    type: string
    sql: ${TABLE}.user_traffic_source ;;
  }

  drill_fields: [order_item_id, product_name, sale_price, user_name]

  measure: count_inventory_items {
    view_label: "Inventory Item"
    label: "# of Inventory Items"
    type: count
  }
  measure: total_sales {
    view_label: "Order Item"
    type: sum
    value_format_name: usd
    sql: ${sale_price} ;;
  }
  dimension: gross_margin {
    view_label: "Order Item"
    type: number
    value_format_name: usd
    hidden: yes
    sql: ${sale_price} - ${inventory_item_cost} ;;
  }
  measure: total_gross_margin {
    view_label: "Order Item"
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;
  }
  measure: count_users {
    view_label: "User"
    label: "# of Users"
    type: count_distinct
    sql: ${user_id} ;;
  }
  measure: count_order_items {
    view_label: "Order Item"
    label: "# of Order Items"
    type: count_distinct
    sql: ${order_item_id} ;;
  }
  measure: count_orders {
    view_label: "Order Item"
    label: "# of Orders"
    type: count_distinct
    sql: ${order_id} ;;
  }
  measure: count_products {
    view_label: "Product"
    label: "# of Products"
    type: count_distinct
    sql: ${product_id} ;;
  }
}
