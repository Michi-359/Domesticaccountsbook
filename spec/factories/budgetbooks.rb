FactoryBot.define do
  factory :budgetbook do
    year { 2024 }
    month { 10 }
    household_size { "1人" }
    housing_type { "賃貸住宅(民間)" }
    annual_income { 3000000 }
    monthly_income { 250000 }
    food_expenses { 40000 }
    housing_expense { 60000 }
    utility_bills { 15000 }
    furniture_cost { 5000 }
    clothing_expenses { 5000 }
    medical_expenses { 5000 }
    transportation_expenses { 10000 }
    communication_expenses { 10000 }
    education_cost { 20000 }
    educational_and_entertainment_expenses { 15000 }
    entertainment_expenses { 30000 }
    savings { 12000 }
    investments { 5000 }
    others { 18000 }
    user_id { 1 }

    association :user, factory: :user
  end
end
