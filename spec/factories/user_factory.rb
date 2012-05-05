FactoryGirl.define  do
  factory :user do
    email                 { "john_doe@example.com" }
    password              { "secret" }
    password_confirmation { "secret" }
  end
end