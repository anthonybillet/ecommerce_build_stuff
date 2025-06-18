view: json_data {
  sql_table_name: `ant-billet-looker-core-argolis.lookml_modelling_data.json_data` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cart {
    type: string
    sql: ${TABLE}.cart ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  dimension: cart_item_id {
    type: string
    sql: ${cart}.item ;;
  }
}

view: cart {

  dimension: item_id {
    type: number
    sql: JSON_VALUE(cart, '$.item_id') ;;
  }

  dimension: item {
    type: string
    sql: JSON_VALUE(cart, '$.item') ;;
  }


  measure: count {
    type: count_distinct
    sql: ${item_id} ;;
  }

}
