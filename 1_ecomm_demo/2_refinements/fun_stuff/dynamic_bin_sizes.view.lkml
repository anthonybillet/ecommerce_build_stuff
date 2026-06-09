include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"
include: "/1_ecomm_demo/3_explores/order_items.explore.lkml"

view: +order_items {

  dimension: final_costing_input_annual_volume {
    view_label: "Z) Dynamic Bin Sizes"
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: max_annual_volume {
    view_label: "Z) Dynamic Bin Sizes"
    type: max
    sql: ${final_costing_input_annual_volume} ;;
  }



  # BIGQUERY: Hidden helper dimension that calculates 100, 1000, 10000, etc. based on the max volume
  dimension: tier_base_scale {
    view_label: "Z) Dynamic Bin Sizes"
    hidden: yes
    type: number
    sql: CAST(COALESCE(GREATEST(100, POWER(10, CEIL(LOG10(NULLIF(${ndt_max_volume.max_volume}, 0))))), 100) AS INT64) ;;
  }

  # BIGQUERY: Clean, rounded tiers based on the power-of-10 scale
  dimension: dynamic_volume_bucket {
    view_label: "Z) Dynamic Bin Sizes"
    type: string
    order_by_field: dynamic_volume_bucket_sort_order
    sql:
    CASE
      WHEN ${final_costing_input_annual_volume} <= 0.25 * ${tier_base_scale}
        THEN FORMAT('0 - %d', CAST(0.25 * ${tier_base_scale} AS INT64))

      WHEN ${final_costing_input_annual_volume} <= 0.50 * ${tier_base_scale}
      THEN FORMAT('%d - %d', CAST(0.25 * ${tier_base_scale} AS INT64), CAST(0.50 * ${tier_base_scale} AS INT64))

      WHEN ${final_costing_input_annual_volume} <= 0.75 * ${tier_base_scale}
      THEN FORMAT('%d - %d', CAST(0.50 * ${tier_base_scale} AS INT64), CAST(0.75 * ${tier_base_scale} AS INT64))

      ELSE
      FORMAT('%d - %d', CAST(0.75 * ${tier_base_scale} AS INT64), CAST(${tier_base_scale} AS INT64))
      END ;;
  }

  # Hidden sorting logic (structurally identical to Redshift)
  dimension: dynamic_volume_bucket_sort_order {
    view_label: "Z) Dynamic Bin Sizes"
    hidden: yes
    type: number
    sql:
    CASE
      WHEN ${final_costing_input_annual_volume} <= 0.25 * ${tier_base_scale} THEN 1
      WHEN ${final_costing_input_annual_volume} <= 0.50 * ${tier_base_scale} THEN 2
      WHEN ${final_costing_input_annual_volume} <= 0.75 * ${tier_base_scale} THEN 3
      ELSE 4
    END ;;
  }
}
view: ndt_max_volume {
  view_label: "Z) Dynamic Bin Sizes"
  derived_table: {
    explore_source: order_items {
      column: max_volume { field: order_items.max_annual_volume }
      bind_all_filters: yes
    }
  }

  dimension: max_volume {
    type: number
    sql: ${TABLE}.max_volume ;;
  }
}

explore: +order_items {
  join: ndt_max_volume {
    type: left_outer
    sql_on: 1=1 ;;
    relationship: many_to_one
  }
}
