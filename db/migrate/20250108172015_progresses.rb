class Progresses < ActiveRecord::Migration[7.1]
  def change
    create_table :progresses do |t|
      t.integer :monthly_savings
      t.integer :months
      t.integer :special_reserve
      t.integer :target_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
