class AddEducationCostToBudgetbooks < ActiveRecord::Migration[7.1]
  def change
    add_column :budgetbooks, :education_cost, :integer
  end
end
