# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vmilist do
    name "MyString"
    child_info "MyText"
    instructor_info "MyText"
    specialization_id 1
  end
end
