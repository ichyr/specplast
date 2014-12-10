# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualification do
    user_id 1
    vmilist_id 1
    confirmed false
  end
end
