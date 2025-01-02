FactoryBot.define do
  factory :budgetbook do
    year { 1 }
    month { 1 }
    household_size { "MyString" }
    housing_type { "MyString" }
    annual_income { 1 }
    monthly_income { 1 }
    food_expenses { 1 }
    housing_expense { 1 }
    utility_bills { 1 }
    furniture_cost { 1 }
    clothing_expenses { 1 }
    medical_expenses { 1 }
    transportation_expenses { 1 }
    communication_expenses { 1 }
    edication_cost { 1 }
    educational_and_entertainment_expenses { 1 }
    entertainment_expenses { 1 }
    savings { 1 }
    investments { 1 }
    others { 1 }
    user_id { 1 }
  end
end
