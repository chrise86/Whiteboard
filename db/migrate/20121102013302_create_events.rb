class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :category_id
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
