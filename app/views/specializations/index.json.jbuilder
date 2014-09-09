json.array!(@specializations) do |specialization|
  json.extract! specialization, :id, :name
  json.url specialization_url(specialization, format: :json)
end
