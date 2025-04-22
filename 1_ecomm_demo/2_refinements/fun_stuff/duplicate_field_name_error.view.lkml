include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"

view: +order_items {

dimension: test_duplicate_field_1 {
  view_label: "Z) Testing Duplicate Field Name Error"
  label: "Duplicate"
  sql:  'Duplicate 1';;
}
  dimension: test_duplicate_field_2 {
    view_label: "Z) Testing Duplicate Field Name Error"
    label: "Duplicate"
    sql:  'Duplicate 2';;
  }

}
