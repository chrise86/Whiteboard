class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, :null => false
      t.datetime :start, :null => false
      t.datetime :end, :null => false
      t.integer :categoryID, :null => false
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
