class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.integer :categoryID
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
