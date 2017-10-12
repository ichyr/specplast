json.id @specialization.id
json.name @specialization.name
json.avatar @specialization.avatar.url

json.vmilists @specialization.vmilists do |vmilist|
  json.id vmilist.id
  json.name vmilist.name
  json.child_info vmilist.child_info
  json.instructor_info vmilist.instructor_info
  json.avatar vmilist.avatar.url
  json.level vmilist.level
  json.status vmilist.status
end