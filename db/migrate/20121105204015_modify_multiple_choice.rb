class ModifyMultipleChoice < ActiveRecord::Migration
  def up
    remove_column :multiple_choices, :eventID
  end

  def down
    add_column :multiple_choices, :eventID, :integer
  end
end
