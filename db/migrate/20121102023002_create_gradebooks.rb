class CreateGradebooks < ActiveRecord::Migration
  def change
    create_table :gradebooks do |t|
      t.integer :eventID
      t.integer :sectionID
      t.integer :userID
      t.float :grade
      t.string :attachment

      t.timestamps
    end
  end
end
