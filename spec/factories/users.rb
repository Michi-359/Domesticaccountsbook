FactoryBot.define do
  factory :user do
    email { |n| "test#{n}@example.com" }
    name { "test_user" }
    password { "password" }
    password_confirmation { "password" }
  end
end
