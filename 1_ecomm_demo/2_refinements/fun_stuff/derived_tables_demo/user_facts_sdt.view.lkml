view: user_facts_sdt {
  view_label: "Z) User Facts SDT"
  derived_table: {
    sql: SELECT
          users.id  AS users_id,
          COALESCE(SUM(order_items.sale_price ), 0) AS order_items_total_sale_price,
          COUNT(DISTINCT order_items.order_id ) AS order_items_order_count,
          COALESCE(SUM(( order_items.sale_price - inventory_items.cost ) ), 0) AS order_items_total_gross_margin
      FROM `looker-private-demo.ecomm.order_items`  AS order_items
      FULL OUTER JOIN `looker-private-demo.ecomm.inventory_items`  AS inventory_items ON inventory_items.id = order_items.inventory_item_id
      LEFT JOIN `looker-private-demo.ecomm.users`  AS users ON order_items.user_id = users.id
      -- {% if users.state._is_filtered %}
      -- WHERE users.state IN ({{ _filters['users.state'] | sql_quote }})
      -- {% endif %}
      GROUP BY
          1
      ;;

    # datagroup_trigger: ecommerce_etl_modified
    # persist_for: "24 hours"
  }

  dimension: user_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: user_lifetime_revenue {
    value_format_name: usd
    type: number
    sql: ${TABLE}.order_items_total_sale_price ;;
  }

  dimension: user_lifetime_orders {
    type: number
    sql: ${TABLE}.order_items_order_count ;;
  }

  dimension: user_lifetime_gross_margin {
    value_format_name: usd
    type: number
    sql: ${TABLE}.order_items_total_gross_margin ;;
  }

  dimension: user_lifetime_orders_tiered {
    type: tier
    tiers: [0,1,2,3,5,7,10]
    style: integer
    sql: ${user_lifetime_orders} ;;
  }

}
