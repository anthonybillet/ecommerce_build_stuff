connection: "sample_bigquery_connection"

include: "/6_live_sheets_source/matches.view.lkml"

explore: matches {
  persist_for: "0 seconds"
}
