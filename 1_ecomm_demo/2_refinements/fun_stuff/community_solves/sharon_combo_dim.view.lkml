include: "/1_ecomm_demo/1_base_dont_edit/products.view.lkml"
include: "/1_ecomm_demo/2_refinements/products_refinements.view.lkml"
view: +products {

  dimension: combination {
    view_label: "Z) Sharon Combo Dim"
    type: string
  }

}
