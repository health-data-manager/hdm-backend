# frozen_string_literal: true

# Adds missing foreign keys to ensure data integrity but also to make deleting
# patient data more feasible using CASCADE
class AddMissingForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :profiles, :users
    add_foreign_key :profile_providers, :profiles
    add_foreign_key :profile_providers, :providers
    add_foreign_key :data_receipts, :profiles
    add_foreign_key :data_receipts, :providers
    add_foreign_key :resources, :profiles
    add_foreign_key :resources, :providers
    add_foreign_key :resources, :data_receipts
    add_foreign_key :resource_histories, :resources
    add_foreign_key :resource_histories, :providers
    add_foreign_key :resource_histories, :data_receipts
    add_foreign_key :provider_applications, :providers
    add_foreign_key :provider_applications, :oauth_applications, column: :application_id
    [
      :allergy_intolerances, :conditions, :goals, :devices, :documents,
      :care_plans, :encounters, :immunizations, :medication_administrations,
      :medication_requests, :medication_statements, :observations, :procedures,
      :practitioners, :operation_outcomes, :explanation_of_benefits,
      :coverages, :claims
    ].each do |table|
      add_foreign_key table, :profiles
    end
  end
end
