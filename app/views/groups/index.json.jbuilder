json.array!(@groups) do |group|
  json.extract! group, :id, :english_name, :french_name
  json.url group_url(group, format: :json)
end
