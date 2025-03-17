view: orders_and_users {
  derived_table: {
    sql: SELECT *
      FROM thelook_ecomm.order_items
      LEFT JOIN thelook_ecomm.users ON users.id = order_items.user_id;;
      persist_for: "24 hours"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    view_label: "Orders"
    label: "Order Item ID"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id {
    view_label: "Orders"
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: user_id {
    view_label: "Users"
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: shipped_at {
    type: time
    sql: ${TABLE}.shipped_at ;;
  }

  dimension_group: delivered_at {
    type: time
    sql: ${TABLE}.delivered_at ;;
  }

  dimension_group: returned_at {
    type: time
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: id_1 {
    type: number
    sql: ${TABLE}.id_1 ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street_address {
    type: string
    sql: ${TABLE}.street_address ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension_group: created_at_1 {
    type: time
    sql: ${TABLE}.created_at_1 ;;
  }

  dimension: user_geom {
    type: string
    sql: ${TABLE}.user_geom ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }
  set: detail {
    fields: [
      id,
      order_id,
      user_id,
      product_id,
      inventory_item_id,
      status,
      created_at_time,
      shipped_at_time,
      delivered_at_time,
      returned_at_time,
      sale_price,
      id_1,
      first_name,
      last_name,
      email,
      age,
      gender,
      state,
      street_address,
      postal_code,
      city,
      country,
      latitude,
      longitude,
      traffic_source,
      created_at_1_time,
      user_geom,
      location
    ]
  }
}
