# Define the database connection to be used for this model.
connection: "billing_account_dashs"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: template_billing_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: template_billing_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Template Billing"

explore: focus {
    join: focus__tags {
      view_label: "Focus: Tags"
      sql: LEFT JOIN UNNEST(${focus.tags}) as focus__tags ;;
      relationship: one_to_many
    }
    join: focus__x_credits {
      view_label: "Focus: X Credits"
      sql: LEFT JOIN UNNEST(${focus.x_credits}) as focus__x_credits ;;
      relationship: many_to_one
    }
}

explore: focus_partner {
  hidden: yes
  join: focus_partner__tags {
    view_label: "Focus Partner: Tags"
    sql: LEFT JOIN UNNEST(${focus_partner.tags}) as focus_partner__tags ;;
    relationship: one_to_many
  }
  join: focus_partner__x_credits {
    view_label: "Focus Partner: X Credits"
    sql: LEFT JOIN UNNEST(${focus_partner.x_credits}) as focus_partner__x_credits ;;
    relationship: one_to_many
  }
}
