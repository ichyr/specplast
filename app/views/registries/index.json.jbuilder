json.array!(@registries) do |registry|
  json.extract! registry, :id, :name, :surname, :dob, :sex, :rank, :troop, :group, :city, :region, :vmilist_id, :achievement_date, :place, :activity, :instruktor_id, :comment
  json.url registry_url(registry, format: :json)
end
