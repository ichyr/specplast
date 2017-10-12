json.specialization @specializations do |spec|
  json.id spec.id
  json.name spec.name
  json.avatar spec.avatar.url

  json.vmilists spec.vmilists do |vmilist|
    json.id vmilist.id
    json.name vmilist.name
    json.child_info vmilist.child_info
    json.instructor_info vmilist.instructor_info
    json.avatar vmilist.avatar.url
    json.level vmilist.level
    json.status vmilist.status
  end
end