json.vmilists @vmilists do |v|
  json.id v.id
  json.name v.name
  json.child_info v.child_info
  json.instructor_info v.instructor_info
  json.specialization_id v.specialization_id
  json.status v.status
  json.level v.level
  json.avatar v.avatar.url
end

