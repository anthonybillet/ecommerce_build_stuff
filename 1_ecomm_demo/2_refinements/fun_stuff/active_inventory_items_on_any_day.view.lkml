view: active_inventory_items_on_any_day {
  derived_table: {
    sql:
      -- Inequality join with date table(other view file)
      -- Gives me every inventory item repeated on every day they were in stock
      SELECT CONCAT(any_date , '_', id) as primary_key, *
      FROM ${dates_table.SQL_TABLE_NAME}
      JOIN looker-private-demo.ecomm.inventory_items  AS inventory_items
      ON DATE(created_at)<= any_date AND DATE(sold_at) >= any_date ;;
      persist_for: "24 hours"
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: ${TABLE}.primary_key ;;
  }

  dimension_group: any_date {
    label: "Any"
    type: time
    datatype: date
    sql: ${TABLE}.any_date ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: created_at {
    type: time
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: sold_at {
    type: time
    sql: ${TABLE}.sold_at ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  drill_fields: [detail*]

  measure: count {
    label: "Row Count"
    type: count
  }

  measure: count_distinct_items {
    label: "# of Inventory Items in Stock"
    type: count_distinct
    sql: ${inventory_item_id} ;;
  }

  set: detail {
    fields: [
      primary_key,
      any_date_date,
      inventory_item_id,
      product_id,
      created_at_date,
      sold_at_time,
      cost,
      product_category,
      product_name,
      product_brand,
      product_retail_price,
      product_department,
      product_sku,
      product_distribution_center_id
    ]
  }
}
