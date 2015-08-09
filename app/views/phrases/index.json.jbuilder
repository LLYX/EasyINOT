json.array!(@phrases) do |phrase|
  json.extract! phrase, :id, :english_phrase, :french_phrase
  json.url phrase_url(phrase, format: :json)
end
