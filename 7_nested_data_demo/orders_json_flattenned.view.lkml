view: orders_json_flattenned {
  derived_table: {
    sql: SELECT
        order_id,
        time,
        JSON_EXTRACT_SCALAR(customer_json, '$.id') AS customer_id,
        JSON_EXTRACT_SCALAR(customer_json, '$.name') AS customer_name,
        JSON_EXTRACT_SCALAR(customer_json, '$.location') AS customer_location,
        product_data.sku,
        product_data.description,
        product_data.quantity,
        product_data.price
      FROM
        `ant-billet-looker-core-argolis.nested_data_examples.orders_customers_products_as_json`
      CROSS JOIN
        UNNEST(JSON_EXTRACT_ARRAY(product_json)) AS product_json_element,
        UNNEST([STRUCT(
            JSON_EXTRACT_SCALAR(product_json_element, '$.sku') AS sku,
            JSON_EXTRACT_SCALAR(product_json_element, '$.description') AS description,
            CAST(JSON_EXTRACT_SCALAR(product_json_element, '$.quantity') AS INT64) AS quantity,
            CAST(JSON_EXTRACT_SCALAR(product_json_element, '$.price') AS FLOAT64) AS price
        )]) AS product_data ;;

      persist_for: "24 hours"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: time {
    type: time
    sql: ${TABLE}.time ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_location {
    type: string
    sql: ${TABLE}.customer_location ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  set: detail {
    fields: [
      order_id,
      time_time,
      customer_id,
      customer_name,
      customer_location,
      sku,
      description,
      quantity,
      price
    ]
  }
}
