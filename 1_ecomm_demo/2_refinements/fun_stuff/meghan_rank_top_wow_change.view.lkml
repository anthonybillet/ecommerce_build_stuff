include: "/1_ecomm_demo/3_explores/order_items.explore.lkml"
view: meghan_rank_top_wow_change {
  view_label: "Z) Meghan Top X based on WoW Change"
  fields_hidden_by_default: yes
  derived_table: {
    explore_source: order_items {
      bind_all_filters: yes
      column: created_week {}
      column: item_name { field: products.item_name }
      column: total_sale_price {}
      derived_column: previous_week_value {
        sql:  LAG(total_sale_price) over (PARTITION BY item_name order by created_week  ) ;;
      }
      derived_column: row_num {
        sql: row_number() over (PARTITION BY item_name order by created_week desc  ) ;;
      }
      filters: {
        field: order_items.created_week
        value: "2 week ago for 2 week"
      }
      # filters: {
      #   field: products.item_name
      #   value: "\"Levi's Men's 501 Jean\",\"Levi's Men's 505 Straight (Regular) Fit Jean\""
      # }
    }
  }
  dimension: created_week {
    description: "Date and time the item was added to the order"
    type: date_week
  }
  dimension: item_name {
    description: ""
  }
  dimension: current_week_sales {
    description: "Total revenue from order items"
    type: number
    sql: ${TABLE}.total_sale_price ;;
  }
  dimension: previous_week_sales {
    type: number
    sql: ${TABLE}.previous_week_value ;;
  }
  dimension: absolute_change {
    type: number
    sql: ${current_week_sales} - COALESCE(${previous_week_sales},0) ;;
  }
  dimension: percent_change {
    type: number
    sql: 1.0*(${current_week_sales} - COALESCE(${previous_week_sales},0))/NULLIF(${previous_week_sales},0) ;;
  }
  dimension: row_num {
    type: number
  }
}

explore: +order_items {
  join: meghan_rank_top_wow_change {
    type: left_outer
    relationship: many_to_many
    sql_on: ${products.item_name} = ${meghan_rank_top_wow_change.item_name} ;;
  }
}


view: meghan_rank_top_wow_change_2 {
  fields_hidden_by_default: yes
  view_label: "Z) Meghan Top X based on WoW Change"
  derived_table: {
    explore_source: order_items {
      column: item_name { field: meghan_rank_top_wow_change.item_name }
      column: row_num { field: meghan_rank_top_wow_change.row_num }
      column: previous_week_sales { field: meghan_rank_top_wow_change.previous_week_sales }
      column: current_week_sales { field: meghan_rank_top_wow_change.current_week_sales }
      column: absolute_change { field: meghan_rank_top_wow_change.absolute_change }
      column: percent_change { field: meghan_rank_top_wow_change.percent_change }
      derived_column: percent_change_rank {
        sql: rank() over (order by percent_change desc) ;;
      }
      derived_column: absolute_change_rank {
        sql: rank() over (order by absolute_change desc) ;;
      }
      filters: {
        field: meghan_rank_top_wow_change.row_num
        value: "1"
      }

    }
  }
  dimension: item_name {
    description: ""
  }
  dimension: row_num {
    description: ""
    type: number
  }
  dimension: previous_week_sales {
    description: ""
    type: number
  }
  dimension: current_week_sales {
    description: "Total revenue from order items"
    type: number
  }
  dimension: absolute_change {
    hidden: no
    description: ""
    type: number
  }
  dimension: percent_change {
    hidden: no
    description: ""
    type: number
  }

  dimension: percent_change_rank {
    hidden: no
    type: number
  }
  dimension: absolute_change_rank {
    hidden: no
    type: number
  }
}

explore: +order_items {
  join: meghan_rank_top_wow_change_2 {
    type: left_outer
    sql_on: ${meghan_rank_top_wow_change_2.item_name} = ${products.item_name} ;;
    relationship: many_to_one
  }
}
