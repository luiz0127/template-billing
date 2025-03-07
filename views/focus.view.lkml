# The name of this view in Looker is "Focus"
view: focus {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ac_billing_grafana.focus` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Availability Zone" in Explore.

  dimension: availability_zone {
    type: string
    sql: ${TABLE}.AvailabilityZone ;;
  }

  dimension: billed_cost {
    type: number
    sql: ${TABLE}.BilledCost ;;
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.BillingAccountId ;;
  }

  dimension: billing_currency {
    type: string
    sql: ${TABLE}.BillingCurrency ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: pricing_category {
    type: string
    sql: ${TABLE}.PricingCategory ;;
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
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

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
    drill_fields: [service_name, commitment_discount_name]
  }
}

# The name of this view in Looker is "Focus Tags"
view: focus__tags {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: focus__tags {
    type: string
    hidden: yes
    sql: focus__tags ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

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

# The name of this view in Looker is "Focus X Credits"
view: focus__x_credits {
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: Id ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: Amount ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: focus__x_credits {
    type: string
    hidden: yes
    sql: focus__x_credits ;;
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
