FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    name { "test_user" }
    password { "password" }
    password_confirmation { "password" }
  end
end
