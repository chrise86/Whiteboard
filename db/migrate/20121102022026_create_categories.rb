class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :userID, :null => false
      t.float :weight
      t.string :name, :null => false

      t.timestamps
    end
  end
end
