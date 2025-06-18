view: with_with_testing {
  derived_table: {
    persist_for: "24 hours"
    sql: -- raw sql results do not include filled-in values for 'order_items.created_date'


      WITH q1 AS ( SELECT
          (DATE(order_items.created_at , 'America/New_York')) AS order_items_created_date,
          COALESCE(SUM(order_items.sale_price), 0) AS order_items_total_sale_price
      FROM looker-private-demo.ecomm.order_items  AS order_items
      GROUP BY
          1
      )
      ,

      q2 AS (SELECT *
      FROM q1)


      SELECT * FROM q2 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: order_items_created_date {
    type: date
    datatype: date
    sql: ${TABLE}.order_items_created_date ;;
  }

  dimension: order_items_total_sale_price {
    type: number
    sql: ${TABLE}.order_items_total_sale_price ;;
  }

  set: detail {
    fields: [
      order_items_created_date,
      order_items_total_sale_price
    ]
  }
}
