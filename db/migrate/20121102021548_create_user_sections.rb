class CreateUserSections < ActiveRecord::Migration
  def change
    create_table :user_sections do |t|
      t.integer :user_id
      t.integer :section_id
      t.decimal :grade, :scale => 5, :precision => 2

      t.timestamps
    end
  end
end
