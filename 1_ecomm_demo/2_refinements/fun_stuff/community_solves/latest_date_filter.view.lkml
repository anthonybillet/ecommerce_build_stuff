#trying to solve this community article:
#https://www.googlecloudcommunity.com/gc/Exploring-Curating-Data/Parameters-Filters-Dynamically-changing-default-date-to-latest/m-p/570647

include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"

view: +order_items {

  dimension: latest_created_date_filter {
    type: string
    order_by_field: date_sorter
    sql: CASE
              WHEN ${created_date} = (SELECT MAX(${created_date})
                                      FROM `thelook_ecomm.order_items` AS order_items)
                THEN ' Latest Order Date'
              ELSE CAST(${created_date} as string)
        END ;;
  }

  dimension: date_sorter {
    type: number
    sql: DATE_DIFF( ${created_date} , '1900-01-01', DAY) * -1 ;;
  }

  #this date sorter comes from this article: http://googlecloudcommunity.com/gc/Modeling/order-by-field-descending/m-p/702971


}
