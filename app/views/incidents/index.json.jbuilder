json.array!(@incidents) do |incident|
  json.extract! incident, :id, :from, :to, :update_number, :priority, :affected_departments, :service_impact, :responsible_service_support_resource_group, :resolved, :status, :resolution, :incident_number, :actual_start_date_and_time, :recorded_start_date_and_time, :incident_responsibility
  json.url incident_url(incident, format: :json)
end
