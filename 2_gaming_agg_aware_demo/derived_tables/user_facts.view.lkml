view: user_facts {
  derived_table: {
    explore_source: events {
      column: user_id {}
      column: player_first_seen {}
      column: player_last_seen {}
      filters: {
        field: events.event_date
        value: ""
      }
    }
    datagroup_trigger: events_raw
    partition_keys: ["player_first_seen"]
  }
  dimension: user_id {
    primary_key: yes
  }
  dimension_group: player_first_seen {
    description: "Not for direct use, use for NDT"
    type: time
  }
  dimension_group: player_last_seen {
    description: "Not for direct use, use for NDT"
    type: time
  }

  dimension_group: since_last_seen {
    intervals: [day,hour,week,month]
    type: duration
    sql_start: ${player_last_seen_raw} ;;
    sql_end: CURRENT_TIMESTAMP ;;
  }
  dimension_group: since_first_seen {
    type: duration
    intervals: [day,hour,week,month]
    sql_start: ${player_first_seen_raw} ;;
    sql_end: CURRENT_TIMESTAMP ;;
  }

  measure: number_of_users {
    type: count
  }
}
