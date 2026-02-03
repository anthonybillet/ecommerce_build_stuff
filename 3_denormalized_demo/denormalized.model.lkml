connection: "argolis"

include: "/3_denormalized_demo/*.view.lkml"

label: "4) Denormalized Demo"

explore: ecomm_denormalized {
  join: distribution_centers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${distribution_centers.id} = ${ecomm_denormalized.product_distribution_center_id} ;;
  }
}
