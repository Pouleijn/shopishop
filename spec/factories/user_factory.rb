FactoryGirl.define  do
  factory :user do
    email                 { "#{Faker::Internet.user_name}@example.com" }
    password              { "secret" }
    password_confirmation { "secret" }
  end
end