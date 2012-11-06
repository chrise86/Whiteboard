class CreateGradebooks < ActiveRecord::Migration
  def change
    create_table :gradebooks do |t|
      t.integer :eventID, :null => false
      t.integer :sectionID, :null => false
      t.integer :userID, :null => false

      t.timestamps
    end
  end
end
