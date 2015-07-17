json.array!(@departments) do |department|
  json.extract! department, :id, :english_name, :french_name
  json.url department_url(department, format: :json)
end
