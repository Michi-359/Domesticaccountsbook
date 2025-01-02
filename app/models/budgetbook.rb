class Budgetbook < ApplicationRecord
  belongs_to :user
  validates :year, presence: true
  validates :month, presence: true
  validates :household_size, presence: true
  validates :housing_type, presence: true
  validates :annual_income, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :monthly_income, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food_expenses, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :housing_expense, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :utility_bills, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :furniture_cost, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :clothing_expenses, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :medical_expenses, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transportation_expenses, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :communication_expenses, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :education_cost, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :educational_and_entertainment_expenses, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :entertainment_expenses, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :savings, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :investments, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
  validates :others, allow_blank: true, numericality: { greater_than_or_equal_to: 0 }
end
