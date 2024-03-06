include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"

view: +order_items {

  measure: actual_sum {
    view_label: "Z) Area Between Lines"
    type: sum
    sql: ${sale_price} ;;
  }

  measure: upper_bound {
    view_label: "Z) Area Between Lines"
    type: number
    sql: 1.2* ${actual_sum} ;;
  }

  measure: lower_bound {
    view_label: "Z) Area Between Lines"
    type: number
    sql: 0.8* ${actual_sum} ;;
  }

}
