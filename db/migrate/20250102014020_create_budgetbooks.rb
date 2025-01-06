class CreateBudgetbooks < ActiveRecord::Migration[7.1]
  def change
    create_table :budgetbooks do |t|
      t.integer :year
      t.integer :month
      t.string :household_size
      t.string :housing_type
      t.integer :annual_income
      t.integer :monthly_income
      t.integer :food_expenses
      t.integer :housing_expense
      t.integer :utility_bills
      t.integer :furniture_cost
      t.integer :clothing_expenses
      t.integer :medical_expenses
      t.integer :transportation_expenses
      t.integer :communication_expenses
      t.integer :edication_cost
      t.integer :educational_and_entertainment_expenses
      t.integer :entertainment_expenses
      t.integer :savings
      t.integer :investments
      t.integer :others
      t.integer :user_id

      t.timestamps
    end
  end
end
