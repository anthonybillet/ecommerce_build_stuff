view: raw_events {
  sql_table_name: `looker-private-demo.gaming.raw_events` ;;
  view_label: "Events"

  dimension: ad_network {
    type: string
    sql: ${TABLE}.ad_network ;;
  }
  dimension: ad_revenue {
    type: number
    sql: ${TABLE}.ad_revenue ;;
  }
  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: continent {
    type: string
    sql: ${TABLE}.continent ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: device_brand {
    type: string
    sql: ${TABLE}.device_brand ;;
  }
  dimension: device_language {
    type: string
    sql: ${TABLE}.device_language ;;
  }
  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
  }
  dimension: device_os_version {
    type: string
    sql: ${TABLE}.device_os_version ;;
  }
  dimension: device_platform {
    type: string
    sql: ${TABLE}.device_platform ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  dimension: game_name {
    type: string
    sql: ${TABLE}.game_name ;;
  }
  dimension: game_version {
    type: string
    sql: ${TABLE}.game_version ;;
  }
  dimension: gems_earned {
    type: number
    sql: ${TABLE}.gems_earned ;;
  }
  dimension: iap_revenue {
    type: number
    sql: ${TABLE}.iap_revenue ;;
  }
  dimension: install_cost {
    type: number
    sql: ${TABLE}.install_cost ;;
  }
  dimension: install_source {
    type: string
    sql: ${TABLE}.install_source ;;
  }
  dimension: is_first_seen {
    type: yesno
    sql: ${TABLE}.is_first_seen ;;
  }
  dimension: player_level {
    type: number
    sql: ${TABLE}.player_level ;;
  }
  dimension: player_session_sequence {
    type: string
    sql: ${TABLE}.player_session_sequence ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: unique_event_id {
    type: string
    sql: ${TABLE}.unique_event_id ;;
  }
  dimension_group: user_first_seen {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.user_first_seen ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count_events {
    type: count
    drill_fields: [game_name, campaign_name, event_name]
  }

  measure: sum_iap_revenue {
    type: sum
    sql: ${iap_revenue} ;;
  }
}
