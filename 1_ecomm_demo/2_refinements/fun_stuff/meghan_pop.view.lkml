include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"

view: +order_items {

  measure: total_sales_test {
    view_label: "Z) Meghan POP"
    type: sum
    sql: ${sale_price} ;;
    filters: [is_first_year: "Yes"]
  }

  measure: count_test {
    view_label: "Z) Meghan POP"
    type: count
    filters: [is_first_year: "Yes"]
  }

  dimension: year_to_string {
    view_label: "Z) Meghan POP"
    type: string
    sql: CAST(${created_year} as STRING) ;;
  }


  filter: first_year_selector {
    view_label: "Z) Meghan POP"
    type: string
    suggest_dimension: year_to_string
  }

  dimension: is_first_year {
    view_label: "Z) Meghan POP"
    type: yesno
    sql: {% condition first_year_selector %} ${year_to_string} {% endcondition %}  ;;
  }

  parameter: metric_selector {
    view_label: "Z) Meghan POP"
    type: unquoted
    allowed_value: {
      value: "Count"
    }
    allowed_value: {
      value: "Sales"
    }
  }

  measure: test_dynamic_measure {
    view_label: "Z) Meghan POP"
    type: number
    value_format_name: decimal_0
    sql: {% if metric_selector._parameter_value == "Sales" %}
            ${total_sales_test}
         {% elsif metric_selector._parameter_value == "Count" %}
             ${count_test}
         {% else %}
             ${count_test}
         {% endif %} ;;
  }

}
