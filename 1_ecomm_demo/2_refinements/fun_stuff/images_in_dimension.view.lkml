include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"
view: +order_items {
  dimension: travel_brand {
    view_label: "Z) Images in Dimensions"
    type: string
    sql: CASE WHEN MOD(${id},2) = 0 THEN '2023/11/Expedia-Logo-1536x864.png' ELSE '2021/05/Booking.Com-logo-1536x864.png'  END ;;
    html: <img src= 'https://1000logos.net/wp-content/uploads/{{value}}' height='100%' width = '100%'> ;;
    # html: <img src= 'https://1000logos.net/wp-content/uploads/2023/11/Expedia-Logo-1536x864.png'> ;;
  }

  dimension: booking_type_and_days_ago {
    view_label: "Z) Images in Dimensions"
    type: string
    sql: 'Accommodation' ;;
    html: <b>{{value}} </b>
            <br>
          {{created_days_ago._value}} days ago;;
  }

  dimension: year_month_and_days_ago {
    view_label: "Z) Images in Dimensions"
    type: string
    sql: CONCAT(${created_month_name} , ' ', ${created_year}) ;;
    html: <b>{{value}} </b>
            <br>
          {{created_days_ago._value}} days ago;;

  }
}
