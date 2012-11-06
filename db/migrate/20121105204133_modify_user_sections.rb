class ModifyUserSections < ActiveRecord::Migration
  def up
    remove_column :user_sections, :grade
    add_column :user_sections, :grade, :double, :precision => 5, :scale => 2
  end

  def down
    remove_column :user_sections, :grade
    add_column :user_sections, :grade, :float
  end
end
