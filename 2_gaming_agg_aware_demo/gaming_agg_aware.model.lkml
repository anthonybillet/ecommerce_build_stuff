connection: "sample_bigquery_connection"
label: "Z) Gaming Aggregate Awareness Demo "

include: "/2_gaming_agg_aware_demo/raw_events.view.lkml"

explore: events_no_agg_awareness {
  label: "Events (No Aggregate Awareness)"
  from: raw_events

  always_filter: {
    filters: [event_date: "2022-11"]
  }
}

explore: events_w_agg_awareness {
  label: "Events (With Aggregate Awareness)"
  from: raw_events

  always_filter: {
    filters: [event_date: "2022-11"]
  }

  aggregate_table: rollup__event_date {
    query: {
      dimensions: [event_date]
      measures: [count_events]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      persist_for: "24 hours"
    }

  }
}
