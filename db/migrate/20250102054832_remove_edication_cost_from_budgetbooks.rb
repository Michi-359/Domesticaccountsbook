class RemoveEdicationCostFromBudgetbooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :budgetbooks, :edication_cost, :integer
  end
end
