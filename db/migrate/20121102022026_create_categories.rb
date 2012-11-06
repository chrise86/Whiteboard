class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :userID
      t.float :weight
      t.string :name

      t.timestamps
    end
  end
end
