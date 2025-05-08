include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"
# Dashboard: https://7d9da728-3eaf-4944-965c-d1d56538803c.looker.app/dashboards/0iiuwmWhjnSK67IrR9wHKG
view: +order_items {

  parameter: measure_selector {
    view_label: "Z) Dynamic Measure and Timeframe Selector"
    label: "Measure Selector"
    type: string
    description: "Use with Dashboards Only"
    allowed_value: {value:"Total Sales"}
    allowed_value: {value:"Total Gross Margin"}
    allowed_value: {value:"Total Orders"}
    default_value: "Total Sales"
  }

  measure: dynamic_measure {
    view_label: "Z) Dynamic Measure and Timeframe Selector"
    label_from_parameter: measure_selector
    description: "Use with Dashboards Only"
    type: number
    value_format_name: decimal_2
    sql:
         {% if measure_selector._parameter_value == "'Total Sales'" %}
            ${total_sale_price}
         {% elsif measure_selector._parameter_value == "'Total Gross Margin'" %}
            ${total_gross_margin}
         {% elsif measure_selector._parameter_value == "'Total Orders'" %}
            ${order_count}
         {% else %}
            ${total_sale_price}
         {% endif %};;
  }

  dimension: selected_measure {
    view_label: "Z) Dynamic Measure and Timeframe Selector"
    type: string
    sql: {% parameter measure_selector %} ;;
  }

  parameter: timeframe_selector {
    view_label: "Z) Dynamic Measure and Timeframe Selector"
    type: string
    description: "Use with Dashboards Only"
    allowed_value: {value:"Date"}
    allowed_value: {value:"Week"}
    allowed_value: {value:"Month"}
    default_value: "Date"
  }

  dimension: dynamic_timeframe {
    label_from_parameter: timeframe_selector
    view_label: "Z) Dynamic Measure and Timeframe Selector"
    type: string
    sql:
          {% if timeframe_selector._parameter_value == "'Date'" %}
            ${created_date}
          {% elsif timeframe_selector._parameter_value == "'Week'" %}
            ${created_week}
          {% elsif timeframe_selector._parameter_value == "'Month'" %}
            ${created_month}
          {% else %}
            ${created_date}
          {% endif %};;
  }


  dimension: selected_timeframe {
    view_label: "Z) Dynamic Measure and Timeframe Selector"
    type: string
    sql: {% parameter timeframe_selector %} ;;
  }

  dimension: chart_title {
    view_label: "Z) Dynamic Measure and Timeframe Selector"
    type: string
    sql: CONCAT(${selected_measure}, ' by ', ${selected_timeframe}) ;;
  }


}
