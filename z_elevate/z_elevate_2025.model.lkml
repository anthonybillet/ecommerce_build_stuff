connection: "argolis"

include: "/z_elevate/**/*.view.lkml"


explore: elevate_nested_data {
  join: elevate_nested_data__address {
    view_label: "Elevate Nested Data: Address"
    sql: LEFT JOIN UNNEST(${elevate_nested_data.address}) as elevate_nested_data__address ;;
    relationship: one_to_many
  }
}
explore: json_data {
  join: cart {
    type: left_outer
    sql: LEFT JOIN UNNEST(JSON_EXTRACT_ARRAY(cart)) as cart ;;
    relationship: one_to_many
  }
}


explore: posts_questions_raw {
  from: posts_questions
}


explore: posts_questions_agg_aware {
  from: posts_questions
}
