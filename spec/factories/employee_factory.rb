FactoryGirl.define do
  factory :employee do
    first_name { "John" }
    last_name { "Doe" }
    gender { "male" }
    association :user
  end
end