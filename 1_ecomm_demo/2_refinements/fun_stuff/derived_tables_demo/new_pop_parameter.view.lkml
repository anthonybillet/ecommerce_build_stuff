include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"

view: +order_items {

  measure: total_sale_price_yoy {
    type: period_over_period
    based_on: total_sale_price
    based_on_time: created_date
    kind: previous
    period: year
    value_format_name: big_money
  }


  measure: total_sale_price_wow {
    type: period_over_period
    based_on: total_sale_price
    based_on_time: created_date
    kind: previous
    period: week
    value_format_name: big_money
  }


  measure: total_sale_price_wow_percent {
    type: period_over_period
    based_on: total_sale_price
    based_on_time: created_date
    kind: relative_change
    period: week
    value_format_name: percent_1
  }



}
