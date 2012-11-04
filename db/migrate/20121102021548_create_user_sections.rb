class CreateUserSections < ActiveRecord::Migration
  def change
    create_table :user_sections do |t|
      t.integer :userID
      t.integer :sectionID
      t.float :grade

      t.timestamps
    end
  end
end
