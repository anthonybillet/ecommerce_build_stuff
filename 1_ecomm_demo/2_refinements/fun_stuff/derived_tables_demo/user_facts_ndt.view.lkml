view: user_facts_ndt {
  view_label: "Z) User Facts NDT"
  derived_table: {
    explore_source: order_items {
      column: id { field: users.id }
      column: total_sale_price {}
      column: order_count {}
      column: total_gross_margin {}
      # bind_all_filters: yes
      # bind_filters: {
      #   from_field:
      #   to_field:
      # }
    }
    datagroup_trigger: ecommerce_etl_modified
    # persist_for: "24 hours"
  }
  dimension: user_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_lifetime_revenue {
    value_format_name: usd
    type: number
    sql: ${TABLE}.total_sale_price ;;
  }

  dimension: user_lifetime_orders {
    type: number
    sql: ${TABLE}.order_count ;;
  }

  dimension: user_lifetime_gross_margin {
    value_format_name: usd
    type: number
    sql: ${TABLE}.total_gross_margin ;;
  }

  dimension: user_lifetime_orders_tiered {
    type: tier
    tiers: [0,1,2,3,5,7,10]
    style: integer
    sql: ${user_lifetime_orders} ;;
  }

}
