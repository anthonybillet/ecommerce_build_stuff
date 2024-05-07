include: "/1_ecomm_demo/2_refinements/products_refinements.view.lkml"

view: +products {


 dimension: is_sku_sold_yesterday {
    view_label: "Z) Report as Filter "
    type: yesno
    sql:  ${sku} IN (SELECT
            products_sku
          FROM
              (SELECT
                      products.sku  AS products_sku,
                      COUNT(*) AS order_items_count
                  FROM looker-private-demo.ecomm.order_items  AS order_items
          FULL OUTER JOIN looker-private-demo.ecomm.inventory_items  AS inventory_items ON inventory_items.id = order_items.inventory_item_id
          LEFT JOIN looker-private-demo.ecomm.products  AS products ON products.id = inventory_items.product_id
                  WHERE ((( order_items.created_at  ) >= ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'America/Los_Angeles'), 'America/Los_Angeles'), INTERVAL -1 DAY), 'America/Los_Angeles'))) AND ( order_items.created_at  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'America/Los_Angeles'), 'America/Los_Angeles'), INTERVAL -1 DAY), 'America/Los_Angeles'), 'America/Los_Angeles'), INTERVAL 1 DAY), 'America/Los_Angeles')))))
                  GROUP BY
                      1
                  HAVING order_items_count > 2) AS t3
                  );;
  }
}
