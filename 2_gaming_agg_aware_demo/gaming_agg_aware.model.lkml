connection: "sample_bigquery_connection"
label: "Z) Gaming Aggregate Awareness Demo "

include: "/2_gaming_agg_aware_demo/views/raw_events.view.lkml"
include: "/2_gaming_agg_aware_demo/derived_tables/user_facts.view.lkml"

datagroup: events_raw { sql_trigger:  SELECT current_date  ;; }
named_value_format: large_usd { value_format: "[>=1000000]\"$\"0.00,,\"M\";[>=1000]\"$\"0.00,\"K\";\"$\"0.00" }
named_value_format: large_number { value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0" }

explore: events {
  from: raw_events

  always_filter: {
    filters: [event_date: "2022-11"]
  }

  join: user_facts {
    view_label: "User Lifetime Values"
    relationship: many_to_one
    sql_on: ${events.user_id} = ${user_facts.user_id} ;;
  }
}

explore: events_no_agg_awareness {
  label: "Events (No Aggregate Awareness)"
  extends: [events]
  view_name: events
}

explore: events_w_agg_awareness {
  label: "Events (With Aggregate Awareness)"
  extends: [events]
  view_name: events

  aggregate_table: rollup__event_date {
    query: {
      dimensions: [event_date]
      measures: [count]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      persist_for: "24 hours"
    }

  }
}
