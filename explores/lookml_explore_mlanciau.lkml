include: "/views/*.view.lkml"

explore: transactions {
  join: transactions__inputs {
    view_label: "Transactions: Inputs"
    sql: LEFT JOIN UNNEST(${transactions.inputs}) as transactions__inputs ;;
    relationship: one_to_many
  }
  join: transactions__outputs {
    view_label: "Transactions: Outputs"
    sql: LEFT JOIN UNNEST(${transactions.outputs}) as transactions__outputs ;;
    relationship: one_to_many
  }
  join: transactions__inputs__addresses {
    view_label: "Transactions: Inputs Addresses"
    sql: LEFT JOIN UNNEST(${transactions__inputs.addresses}) as transactions__inputs__addresses ;;
    relationship: one_to_many
  }
  join: transactions__outputs__addresses {
    view_label: "Transactions: Outputs Addresses"
    sql: LEFT JOIN UNNEST(${transactions__outputs.addresses}) as transactions__outputs__addresses ;;
    relationship: one_to_many
  }
}
