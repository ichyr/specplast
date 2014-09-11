json.array!(@vmilists) do |vmilist|
  json.extract! vmilist, :id, :name, :child_info, :instructor_info, :specialization_id
  json.url vmilist_url(vmilist, format: :json)
end
