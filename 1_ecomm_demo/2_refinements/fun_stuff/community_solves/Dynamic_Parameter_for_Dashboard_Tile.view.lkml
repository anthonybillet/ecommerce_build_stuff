include: "/1_ecomm_demo/2_refinements/distribution_centers_refinements.view.lkml"

# https://www.googlecloudcommunity.com/gc/Modeling/Dynamic-Parameter-for-Dashboard-Tile/td-p/749345

view: +distribution_centers {

  dimension: region {
    view_label: "Z) Dynamic Parameter for Dashboard Tile"
    type: string
    sql: ${name} ;;
  }

  parameter: region_selector {
    view_label: "Z) Dynamic Parameter for Dashboard Tile"
    type: string
    suggest_dimension: region
  }


  dimension: is_selected_region {
    view_label: "Z) Dynamic Parameter for Dashboard Tile"
    type: yesno
    sql: ${region} = {% parameter region_selector %} ;;
  }

  measure: total_sales_for_region {
    view_label: "Z) Dynamic Parameter for Dashboard Tile"
    type: sum
    sql: ${order_items.sale_price} ;;
    filters: [is_selected_region: "Yes"]
  }

}
