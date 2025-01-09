FactoryBot.define do
  factory :progress do
    purpose_of_saving { "旅費" }
    monthly_savings { 5000 }
    months { 7 }
    special_reserve { 8000 }
    target_amount { 100000 }
  end
end
  