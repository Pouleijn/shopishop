FactoryGirl.define do
  sequence :id do |n|
    n
  end

  factory :category do
    name {  "name-#{next(:id)}" }
  end
end