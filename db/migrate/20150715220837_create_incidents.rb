class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.text :from
      t.text :to
      t.string :update_number
      t.string :priority
      t.text :affected_departments
      t.text :service_impact
      t.text :responsible_service_support_resource_group
      t.boolean :resolved
      t.text :status
      t.text :resolution
      t.string :incident_number
      t.datetime :actual_start_date_and_time
      t.datetime :recorded_start_date_and_time
      t.datetime :resolved_date_and_time
      t.text :incident_responsibility

      t.timestamps null: false
    end
  end
end
