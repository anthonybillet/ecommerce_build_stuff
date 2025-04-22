# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: orders_customers_products_as_bq_structs {
  hidden: yes
    join: orders_customers_products_as_bq_structs__product {
      view_label: "Orders Customers Products As Bq Structs: Product"
      sql: LEFT JOIN UNNEST(${orders_customers_products_as_bq_structs.product}) as orders_customers_products_as_bq_structs__product ;;
      relationship: one_to_many
    }
}
view: orders_customers_products_as_bq_structs {
  sql_table_name: `ant-billet-looker-core-argolis.nested_data_examples.orders_customers_products_as_bq_structs` ;;

  dimension: customer__id {
    type: number
    sql: ${TABLE}.customer.id ;;
    group_label: "Customer"
    group_item_label: "ID"
  }
  dimension: customer__location {
    type: string
    sql: ${TABLE}.customer.location ;;
    group_label: "Customer"
    group_item_label: "Location"
  }
  dimension: customer__name {
    type: string
    sql: ${TABLE}.customer.name ;;
    group_label: "Customer"
    group_item_label: "Name"
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: product {
    hidden: yes
    sql: ${TABLE}.product ;;
  }
  dimension_group: time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time ;;
  }
  measure: count {
    type: count
    drill_fields: [customer__name]
  }
}

view: orders_customers_products_as_bq_structs__product {

  dimension: description {
    type: string
    sql: description ;;
  }
  dimension: orders_customers_products_as_bq_structs__product {
    type: string
    hidden: yes
    sql: orders_customers_products_as_bq_structs__product ;;
  }
  dimension: price {
    type: number
    sql: price ;;
  }
  dimension: quantity {
    type: number
    sql: quantity ;;
  }
  dimension: sku {
    type: string
    sql: sku ;;
  }
}
