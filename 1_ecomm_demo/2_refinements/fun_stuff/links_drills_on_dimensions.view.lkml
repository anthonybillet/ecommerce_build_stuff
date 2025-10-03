include: "/1_ecomm_demo/1_base_dont_edit/products.view.lkml"
include: "/1_ecomm_demo/2_refinements/products_refinements.view.lkml"

view: +products {

  dimension: dummy_drill { # this is a a dimension we use purely to avoid having a default drill option for sku(IP)
    hidden: yes # this hides our dummy dimension from the front end
    type: string
    drill_fields: [sku] # doesn't matter what we put here, this is the {{ dummy_drill._link }} part we will override in our sku (IP) field
    sql: 'dummy' ;; # just put any string here doesnt matter and won't showup in the UI
  }

  dimension: sku { #this would be the IP field for your code
    label: "SKU"
    drill_fields: [] #this removes looker's default drill so we only have the product details drill
    link: {
      label: "Product Details"
      url: "{{ dummy_drill._link }}&fields=products.sku,products.brand,products.category"
      # {{ dummy_drill._link }} says: do this in the drill pop up and &fields= sets the fields you want to show up (all fields must be joined to this view via the explore somehow)
    }
  }

}
