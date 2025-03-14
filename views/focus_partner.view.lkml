view: focus_partner {
  sql_table_name: `avenuecode-prod.ac_billing_grafana.focus_partner` ;;

  dimension: amount_in_pricing_unit {
    type: number
    sql: ${TABLE}.amount_in_pricing_unit ;;
  }
  dimension: availability_zone {
    type: string
    sql: ${TABLE}.AvailabilityZone ;;
  }
  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.BillingAccountId ;;
  }
  dimension: billing_currency {
    type: string
    sql: ${TABLE}.BillingCurrency ;;
  }
  dimension_group: billing_period_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.BillingPeriodEnd ;;
  }
  dimension_group: billing_period_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.BillingPeriodStart ;;
  }
  dimension: charge_class {
    type: string
    sql: ${TABLE}.ChargeClass ;;
  }
  dimension: charge_description {
    type: string
    sql: ${TABLE}.ChargeDescription ;;
  }
  dimension_group: charge_period_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ChargePeriodEnd ;;
  }
  dimension_group: charge_period_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ChargePeriodStart ;;
  }
  dimension: commitment_discount_category {
    type: string
    sql: ${TABLE}.CommitmentDiscountCategory ;;
  }
  dimension: commitment_discount_id {
    type: string
    sql: ${TABLE}.CommitmentDiscountId ;;
  }
  dimension: commitment_discount_name {
    type: string
    sql: ${TABLE}.CommitmentDiscountName ;;
  }
  dimension: consumed_quantity {
    type: number
    sql: ${TABLE}.ConsumedQuantity ;;
  }
  dimension: consumed_unit {
    type: string
    sql: ${TABLE}.ConsumedUnit ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: cost_at_list {
    type: number
    sql: ${TABLE}.cost_at_list ;;
  }
  dimension: credits {
    type: number
    sql: ${TABLE}.credits ;;
  }
  dimension: customer_amount {
    type: number
    sql: ${TABLE}.customer_amount ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.CustomerName ;;
  }
  dimension: effective_price {
    type: number
    sql: ${TABLE}.effective_price ;;
  }
  dimension: net_cost {
    type: number
    sql: ${TABLE}.NetCost ;;
  }
  dimension: pricing_category {
    type: string
    sql: ${TABLE}.PricingCategory ;;
  }
  dimension: project_name {
    type: string
    sql: ${TABLE}.ProjectName ;;
  }
  dimension: region_name {
    type: string
    sql: ${TABLE}.RegionName ;;
  }
  dimension: resource_name {
    type: string
    sql: ${TABLE}.ResourceName ;;
  }
  dimension: service_name {
    type: string
    sql: ${TABLE}.ServiceName ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.SkuId ;;
  }
  dimension: sku_price_id {
    type: string
    sql: ${TABLE}.SkuPriceId ;;
  }
  dimension: sub_account_id {
    type: string
    sql: ${TABLE}.SubAccountId ;;
  }
  dimension: tags {
    hidden: yes
    sql: ${TABLE}.Tags ;;
  }
  dimension: x_cost {
    type: number
    sql: ${TABLE}.x_Cost ;;
  }
  dimension: x_cost_type {
    type: string
    sql: ${TABLE}.x_CostType ;;
  }
  dimension: x_credits {
    hidden: yes
    sql: ${TABLE}.x_Credits ;;
  }
  measure: count {
    type: count
  }

  measure: total_cost {
    type: sum
    sql: ${cost} ;;
  }

  measure: total_credits {
    type: sum
    sql: ${credits} ;;
  }

  measure: total_amount_in_pricing_unit {
    type: sum
    sql: ${amount_in_pricing_unit} ;;
  }

  measure: total_customer_amount {
    type: sum
    sql: ${customer_amount} ;;
  }

  measure: total_cost_at_list {
    type: sum
    sql: ${cost_at_list} ;;
  }

  measure: total_effective_price {
    type: sum
    sql: ${effective_price} ;;
  }

  measure: total_net_cost {
    type: sum
    sql: ${net_cost} ;;
  }
  measure: gross_profit {
    type: number
    sql: ${total_customer_amount} - ${total_credits} ;;
  }
  measure: customer_cost {
    type: number
    sql: ${total_net_cost} + ${gross_profit} ;;
  }

}

view: focus_partner__tags {

  dimension: focus_partner__tags {
    type: string
    hidden: yes
    sql: focus_partner__tags ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
  dimension: x_inherited {
    type: yesno
    sql: x_inherited ;;
  }
  dimension: x_namespace {
    type: string
    sql: x_namespace ;;
  }
  dimension: x_type {
    type: string
    sql: x_type ;;
  }
}

view: focus_partner__x_credits {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: Id ;;
  }
  dimension: amount {
    type: number
    sql: Amount ;;
  }
  dimension: focus_partner__x_credits {
    type: string
    hidden: yes
    sql: focus_partner__x_credits ;;
  }
  dimension: full_name {
    type: string
    sql: FullName ;;
  }
  dimension: name {
    type: string
    sql: Name ;;
  }
  dimension: type {
    type: string
    sql: Type ;;
  }
}
