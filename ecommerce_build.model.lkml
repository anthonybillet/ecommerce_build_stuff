connection: "sample_bigquery_connection"

include: "/1_base_dont_edit/*.view.lkml"
include: "/2_refinements/**/**.view.lkml"
include: "/3_explores/*.explore.lkml"

label: "2) Ecommerce Build Stuff"

datagroup: ecommerce_etl_modified {
  sql_trigger: SELECT MAX(DATE(created_at)) FROM `looker-private-demo.ecomm.events` ;;
  max_cache_age: "24 hours"
}

persist_with: ecommerce_etl_modified
