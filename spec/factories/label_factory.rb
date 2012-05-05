FactoryGirl.define do
  factory :label do
    name {  "name-#{next(:id)}" }
  end
end