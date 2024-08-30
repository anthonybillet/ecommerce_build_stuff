include: "/1_ecomm_demo/1_base_dont_edit/order_items.view.lkml"
include: "/1_ecomm_demo/2_refinements/order_items_refinements.view.lkml"


# https://www.googlecloudcommunity.com/gc/Developing-Applications/getting-null-values-in-data-actions-of-select-dropdown/td-p/798084
view: +order_items {
  dimension: test_action_all_nulls {
    view_label: "Z) Test Action All Nulls"
    type: string
    sql: 'Test' ;;

    action: {
      label: "Give Feedback"
      url: "https://demo.cloudfunctions.net/function-demo"

      param: {
        name: "clinical_feedback"
        value: "{{ value }}"
      }

      form_param: {
        name: "annotation"
        type: select
        label: "Feeback"
        default: "No"
        description: "Please provide feedback"
        option: {
          name: "No"
          label: "No"
        }
        option: {
          name: "Yes"
          label: "Yes"
        }
        option: {
          name: "Deferred"
          label: "Deferred"
        }
      }
    }
  }

}
