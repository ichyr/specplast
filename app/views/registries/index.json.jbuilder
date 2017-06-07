json.array!(@registries) do |registry|
  json.extract! registry, :id, :name, :surname, :email, :sex, :rank, :troop, :group, :city, :region, :vmilist_id, :achievement_date, :place, :activity, :instruktor_id, :comment, :photo_url
  json.dob registry.dob.to_date.year
  json.rank registry.rank.title
  json.vmilist registry.vmilist.name
  json.instruktor registry.instruktor.name
  json.url registry_url(registry, format: :json)
end
