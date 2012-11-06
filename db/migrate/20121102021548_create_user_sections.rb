class CreateUserSections < ActiveRecord::Migration
  def change
    create_table :user_sections do |t|
      t.integer :userID, :null => false
      t.integer :sectionID, :null => false
      t.decimal :grade, :scale => 5, :precision => 2

      t.timestamps
    end
  end
end
