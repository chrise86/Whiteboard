class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.float :weight
      t.string :name

      t.timestamps
    end
  end
end
