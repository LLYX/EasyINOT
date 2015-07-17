json.array!(@applications) do |application|
  json.extract! application, :id, :english_name, :french_name, :critical
  json.url application_url(application, format: :json)
end
