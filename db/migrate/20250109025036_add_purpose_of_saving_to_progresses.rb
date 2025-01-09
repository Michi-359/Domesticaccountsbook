class AddPurposeOfSavingToProgresses < ActiveRecord::Migration[7.1]
  def change
    add_column :progresses, :purpose_of_saving, :string
  end
end
