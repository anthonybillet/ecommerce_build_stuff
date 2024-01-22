include: "/1_base_dont_edit/distribution_centers.view.lkml"

view: +distribution_centers {

  #### Base Dimensions Refined ####

  dimension: latitude {
    hidden: yes
  }

  dimension: longitude {
    hidden: yes
  }

  dimension: id {
    label: "Distribution Center ID"
    value_format_name: id
  }
  dimension: name {
    label: "Distribution Center Name"
  }

  #### Custom Dimensions ####

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  #### M3asures ####


}
