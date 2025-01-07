class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :category
      t.string :body

      t.timestamps
    end
  end
end
