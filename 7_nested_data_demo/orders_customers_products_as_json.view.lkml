view: orders_customers_products_as_json {
  sql_table_name: `ant-billet-looker-core-argolis.nested_data_examples.orders_customers_products_as_json` ;;

  dimension: customer_json {
    type: string
    sql: ${TABLE}.customer_json ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_json {
    type: string
    sql: ${TABLE}.product_json ;;
  }
  dimension_group: time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time ;;
  }

  dimension: customer_id {
    type: number
    sql: JSON_EXTRACT_SCALAR(${customer_json}, '$.id') ;;
  }
  measure: count {
    type: count
  }
}
