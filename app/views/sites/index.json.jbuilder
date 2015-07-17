json.array!(@sites) do |site|
  json.extract! site, :id, :site_code, :english_name, :french_name, :designated
  json.url site_url(site, format: :json)
end
