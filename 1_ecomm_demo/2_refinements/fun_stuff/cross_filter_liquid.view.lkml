include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"

view: +order_items {
  #dashboard: https://7d9da728-3eaf-4944-965c-d1d56538803c.looker.app/dashboards/psI6RHX1nMehLQf1VaecbS?Date=6+months

  # dimension_group: date_for_filter {
  #   view_label: "Z) Cross filter Liquid"
  #   type: time
  #   sql: ${created_raw} ;;
  # }

  dimension: month_for_filter{
    view_label: "Z) Cross filter Liquid"
    type: date_month
    sql: ${created_raw} ;;
    link: {
      label: "Cross Filter Dashboard to Date: {{value}}"
      url: "/dashboards/psI6RHX1nMehLQf1VaecbS?Date={{value}}?Product+Category={{_filters['products.category'] | url_encode}}"
    }

    link: {
      label: "Reset Dashboard"
      url: "/dashboards/psI6RHX1nMehLQf1VaecbS"
    }
  }

}
