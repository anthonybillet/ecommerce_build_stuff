---
- dashboard: drills_and_cross_filters
  title: Drills and Cross Filters
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: qQFvqNqHLRi2c5Spop5GIS
  elements:
  - title: Sales and Users by State
    name: Sales and Users by State
    model: ecommerce_build
    explore: order_items
    type: looker_geo_choropleth
    fields: [order_items.total_sale_price, users.state, users.count]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 8
    col: 0
    width: 9
    height: 5
  - title: Sales and Users By Zip
    name: Sales and Users By Zip
    model: ecommerce_build
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.zip, users.count]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    defaults_version: 0
    map: usa
    map_projection: ''
    quantize_colors: false
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 4
    col: 9
    width: 8
    height: 9
  - title: Sales and Users by Coordinates
    name: Sales and Users by Coordinates
    model: ecommerce_build
    explore: order_items
    type: looker_google_map
    fields: [order_items.total_sale_price, users.count, users.location]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: person
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_radius_max: 10
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 0
    map: usa
    map_projection: ''
    quantize_colors: false
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 4
    col: 17
    width: 7
    height: 9
  - title: Top Categories
    name: Top Categories
    model: ecommerce_build
    explore: order_items
    type: looker_pie
    fields: [order_items.total_sale_price, products.category]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
    column_limit: 50
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 2
    col: 0
    width: 9
    height: 6
  - title: Sales by Month
    name: Sales by Month
    model: ecommerce_build
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.created_month]
    fill_fields: [order_items.created_month]
    filters:
      users.country: USA
    sorts: [order_items.created_month desc]
    limit: 1000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Order Items Total Sale Price}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    value_labels: labels
    label_type: labVal
    inner_radius: 50
    hidden_fields: []
    hidden_points_if_no: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 9
    width: 15
    height: 4
  - title: Total Sales
    name: Total Sales
    model: ecommerce_build
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 0
    col: 0
    width: 9
    height: 2
  - title: Tabular Sales
    name: Tabular Sales
    model: ecommerce_build
    explore: order_items
    type: looker_grid
    fields: [users.state, users.city, order_items.count, order_items.total_sale_price,
      users.count]
    filters:
      users.country: USA
    sorts: [order_items.total_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${order_items.total_sale_price}/${users.count}"
      label: Avg Sales Per User
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: avg_sales_per_user
      _type_hint: number
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      order_items.count: Order Items
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
      users.count:
        is_active: true
      order_items.count:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [avg_sales_per_user]}]
    hidden_fields: []
    hidden_points_if_no: []
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    map: usa
    map_projection: ''
    quantize_colors: false
    hidden_pivots: {}
    y_axes: []
    listen:
      Created Date: order_items.created_date
    row: 13
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 12 month ago for 12 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: ecommerce_build
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
