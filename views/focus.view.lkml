
view: focus {
  sql_table_name: `ac_billing_grafana.focus`;;

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
    # primary_key: yes
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
    # primary_key: yes
  }
  measure: count {
    type: count
    drill_fields: [project_name, region_name, service_name, commitment_discount_name]
  }
  measure: sum_cost {
    type: sum
    sql: ${billed_cost} ;;
  }

  dimension: service_area {
    type: string
    sql:
    CASE
          WHEN ${service_name} IN (
            'AlloyDB', 'BigQuery', 'Cloud Bigtable', 'Cloud SQL'
          ) THEN 'Database'

          WHEN ${service_name} IN (
            'Cloud Functions', 'Cloud Run', 'Cloud Run Functions', 'App Engine'
          ) THEN 'Serverless'

          WHEN ${service_name} IN (
            'Vertex AI', 'Vertex AI Search', 'Duet AI', 'Generative AI App Builder - Enterprise Search',
            'Cloud Natural Language', 'Deep Learning VM', 'Translate', 'Custom Search'
          ) THEN 'AI & Machine Learning'

          WHEN ${service_name} IN (
            'Cloud DNS', 'Cloud Load Balancing', 'Networking', 'Cloud Domains'
          ) THEN 'Networking'

          WHEN ${service_name} IN (
            'Compute Engine', 'Anthos / GDC-V', 'Anthos Service Mesh', 'GKE Enterprise / GDC', 'Kubernetes Engine'
          ) THEN 'Infrastructure and Orchestration'

          WHEN ${service_name} IN (
            'Cloud Key Management Service (KMS)', 'Secret Manager', 'Certificate Authority Service',
            'reCAPTCHA Enterprise', 'Identity Platform', 'Cloud Monitoring',
            'Cloud Logging'
          ) THEN 'Security and Monitoring'

          WHEN ${service_name} IN (
            'Cloud Data Fusion', 'Cloud Dataflow', 'Dataplex', 'Cloud Composer',
            'Dataproc', 'Datastream', 'Cloud Data Loss Prevention'
          ) THEN 'Data Integration & Processing'

          WHEN ${service_name} IN (
            'API Gateway', 'Cloud Dialogflow API', 'Cloud Pub/Sub', 'Cloud Memorystore for Redis', 'Apigee', 'Cloud Vision API', 'Cloud Speech API', 'Cloud Text-to-Speech API', 'Retail API', 'Distance Matrix API', 'Geocoding API', 'Places API', 'BigQuery Reservation API', 'BigQuery Storage API', 'Application Integration', 'Cloud Document AI API', 'Gemini API'
          ) THEN 'API & Microservices'

          WHEN ${service_name} IN (
            'Artifact Registry', 'Backup and DR Service', 'Backup for GKE', 'Container Registry Vulnerability Scanning', 'Cloud Storage', 'NetApp Volumes'
          ) THEN 'Storage & Backup'

          WHEN ${service_name} IN (
            'Cloud Build', 'Source Repository', 'Cloud Scheduler', 'Cloud Tasks', 'Data Catalog'
          ) THEN 'Developer Tools'

          WHEN ${service_name} IN (
            'Looker Studio', 'Looker', 'Firebase Hosting', 'Firebase Realtime Database',
            'Recommendations AI'
          ) THEN 'Business Solutions'

          ELSE 'Other'
        END
       ;;
      drill_fields: [service_name, sum_cost]
      value_format: "\"R$\" #,##0.00"
  }

  dimension: database_service {
    type: string
    sql: CASE WHEN ${service_name} IN ('AlloyDB', 'BigQuery', 'Cloud Bigtable', 'Cloud SQL', 'Cloud Storage') THEN ${service_name} ELSE NULL END ;;
  }

}

view: focus__tags {

  dimension: focus__tags {
    type: string
    hidden: yes
    sql: focus__tags ;;
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

view: focus__x_credits {
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
    sql: CASE WHEN Type IS NULL THEN 'No Credits' ELSE Type END ;;
    drill_fields: [
      full_name,
      sum_credits
    ]
  }

  measure: sum_credits {
    type: number
    sql: SUM(${amount}) ;;
    drill_fields: [
      type,
      name,
      focus.service_name,
      sum_credits
    ]
  }

  measure: count_type {
    type: number
    sql: COUNT(${type}) ;;
  }
}
